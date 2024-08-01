const express = require('express');
const { handleGetPopularArt, handleCreatePoplarArt } = require('../controllers/popular');

const router = express.Router();

router.get('/', handleGetPopularArt);
router.post('/', handleCreatePoplarArt);

module.exports = router;