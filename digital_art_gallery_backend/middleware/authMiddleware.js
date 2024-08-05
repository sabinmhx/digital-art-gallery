const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
    const token = req.header('Authorization').replace('Bearer ', '');
    if (!token) {
        return res.status(401).send({ error: 'Access denied' });
    }
    try {
        const decoded = jwt.verify(token, process.env.SECRET_ACCESS_TOKEN);
        req.user = decoded;
        next();
    } catch (error) {
        res.status(401).send({ error: 'Invalid token' });
    }
};

module.exports = authMiddleware;
