const mongoose = require('mongoose');

const popularArtSchema = new mongoose.Schema({
    image_url: {
        type: String,
        required: true
    },
    profile_image: {
        type: String,
        required: true
    },
    designer_name: {
        type: String,
        required: true
    },
    number_of_likes: {
        type: Number,
        required: true
    },
    number_of_views: {
        type: Number,
        required: true
    }
});

const PopularArt = mongoose.model('PopularArt', popularArtSchema);

module.exports = PopularArt;