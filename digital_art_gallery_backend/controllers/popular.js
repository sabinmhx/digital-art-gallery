const PopularArt = require('../models/popular');

async function handleGetPopularArt() {
    try {
        const popularArt = await PopularArt.find();
        const popularArtList = popularArt.map(art => ({
            image_url: art.image_url,
            profile_image: art.profile_image,
            designer_name: art.designer_name,
            number_of_likes: art.number_of_likes,
            number_of_views: art.number_of_views
        }));
        res.json({ popular_art_list: popularArtList });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
}

async function handleCreatePoplarArt() {
    const popularArt = new PopularArt({
        image_url: req.body.image_url,
        profile_image: req.body.profile_image,
        designer_name: req.body.designer_name,
        number_of_likes: req.body.number_of_likes,
        number_of_views: req.body.number_of_views
    });

    try {
        const newPopularArt = await popularArt.save();
        res.status(201).json({ "message": "Popular Art added to list" });
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
}

module.exports = { handleGetPopularArt, handleCreatePoplarArt };