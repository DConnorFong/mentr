const express = require('express');
const userRouter = require('./routers/user');
const mentors = require('./data/mentors');
// const generateMentrData = require('./util/generate-mentr-data');

const app = express();

app.use(express.json());
app.use(userRouter);

// TEMP: validate mentor dataset
let valid = true;

for (i = 0; i < mentors.length; i++) {
    if (i != mentors[i].id) {
        valid = false;
    }
}

console.log(`Mentor dataset validated: ${valid}`);

module.exports = app;
