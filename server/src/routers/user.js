const mentors = require('../data/mentors');
const express = require('express');
const router = express.Router();

router.get('/user/batch/:count/:index', async (req, res) => {});

router.get('/user/:id', async (req, res) => {
    const id = req.params.id;

    if (id > mentors.length - 1 || id < 0) {
        res.status(400).send({
            error: 'Invalid user ID',
        });
    }

    // TODO: secure sensitive information (when added to schema)
    res.send(mentors[id]);
});

// Health
router.get('/', async (req, res) => {
    res.send('Mentr service is available');
});

module.exports = router;
