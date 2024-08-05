require('dotenv').config();

const express = require("express");
const { connectDB } = require("./connection");
const bodyParser = require('body-parser');
const popularRouter = require("./routes/popular");
const authRouter = require('./routes/auth');


connectDB(process.env.URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true
})
    .then(() => { console.log("MongoDB Connected"); })
    .catch((error) => { console.error(error); });

const app = express();

app.use(bodyParser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/popular", popularRouter);
app.use('/auth', authRouter);

app.get("/", (req, res) => { res.send("Welcome to the Art API!"); });

app.listen(process.env.PORT, '0.0.0.0', () => {
    console.log(`Server is running on port ${process.env.PORT}`);
});