const User = require('../models/User');
const jwt = require('jsonwebtoken');

exports.register = async (req, res) => {
    try {
        const { email, password } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).send({ success: false, message: 'Email already in use' });
        }

        const user = new User({ email, password });
        await user.save();
        res.status(201).send({ success: true, message: 'User registered successfully' });
    } catch (error) {
        res.status(400).send({ success: false, message: error.message });
    }
};

exports.login = async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });

        if (!user) {
            return res.status(401).send({ success: false, message: 'Invalid email or password' });
        }

        const isMatch = await user.comparePassword(password);
        if (!isMatch) {
            return res.status(401).send({ success: false, message: 'Invalid email or password' });
        }

        const accessToken = jwt.sign({ id: user._id }, process.env.SECRET_ACCESS_TOKEN, { expiresIn: '15m' });
        const refreshToken = jwt.sign({ id: user._id }, process.env.SECRET_REFRESH_TOKEN, { expiresIn: '7d' });

        user.refreshToken = refreshToken;
        await user.save();

        res.send({ success: true, message: 'Login successful', accessToken, refreshToken });
    } catch (error) {
        res.status(400).send({ success: false, message: error.message });
    }
};

exports.refreshToken = async (req, res) => {
    try {
        const { token } = req.body;
        if (!token) {
            return res.status(401).send({ success: false, message: 'Refresh Token is required' });
        }

        const decoded = jwt.verify(token, process.env.SECRET_REFRESH_TOKEN);
        const user = await User.findById(decoded.id);

        if (!user || user.refreshToken !== token) {
            return res.status(403).send({ success: false, message: 'Invalid refresh token' });
        }

        const accessToken = jwt.sign({ id: user._id }, process.env.SECRET_ACCESS_TOKEN, { expiresIn: '15m' });

        res.send({ success: true, accessToken });
    } catch (error) {
        res.status(403).send({ success: false, message: 'Invalid refresh token' });
    }
};
