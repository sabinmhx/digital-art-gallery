const express = require("express");
const { connectDB } = require("./connection");
const popularRouter = require("./routes/popular");

connectDB("mongodb://127.0.0.1:27017/art")
    .then(() => { console.log("MongoDB Connected"); })
    .catch((error) => { console.error(error); });

const app = express();
const PORT = 8000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/popular", popularRouter);

app.get("/", (req, res) => { res.send("Welcome to the Art API!"); });

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server is running on port ${PORT}`);
});