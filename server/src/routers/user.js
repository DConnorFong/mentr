const mentors = require('../data/mentors');
const express = require('express');
const router = express.Router();

router.get('/user/batch/:index/:count', async (req, res) => {
    const count = parseInt(req.params.count);
    const index = parseInt(req.params.index);

    if (count <= 0) {
        res.status(400).send({
            error: 'Invalid count',
        });
        return;
    }

    if (index > mentors.length - 1 || index < 0) {
        res.status(400).send({
            error: 'Invalid starting index',
        });
        return;
    }

    let endIndex = index + count;

    if (endIndex > mentors.length) {
        endIndex = mentors.length;
    }

    res.send(mentors.slice(index, endIndex));
});

router.get('/user/batch/:sort', async (req, res) => {
    const sort = req.params.sort;

    const facultyHash = ['arts', 'commerce', 'engineering', 'forestry', 'lfs', 'science'];
    const faculty = ['Arts', 'Commerce', 'Engineering', 'Forestry', 'Land and Food Systems', 'Science'];

    let contains = false;
    let index = -1;

    for (i = 0; i < facultyHash.length; i++) {
        if (sort === facultyHash[i]) {
            index = i;
            contains = true;
        }
    }

    if (contains === false) {
        res.status(404).send({
            error: 'Invalid faculty request',
        });
        return;
    }

    const ret = [];

    for (const mentor of mentors) {
        if (mentor.faculty === faculty[index]) {
            ret.push(mentor);
        }
    }

    res.send(ret);
});

router.get('/user/:id', async (req, res) => {
    const id = req.params.id;

    if (id > mentors.length - 1 || id < 0) {
        res.status(400).send({
            error: 'Invalid user ID',
        });
        return;
    }

    // TODO: secure sensitive information (when added to schema)
    res.send(mentors[id]);
});

// Health
router.get('/', async (req, res) => {
    res.send('Mentr service is available');
});

module.exports = router;
