const Faker = require('faker');

const greeting = ['Hey there!', 'Howdy?', 'How are you doing?', 'Nice to meet you.', 'Yo.'];

const interest = [
    'Reading',
    'Watching TV',
    'Family Time',
    'Going to Movies',
    'Fishing',
    'Computer',
    'Gardening',
    'Renting Movies',
    'Walking',
    'Exercise',
    'Listening to Music',
    'Entertaining',
    'Hunting',
    'Team Sports',
    'Shopping',
    'Traveling',
    'Sleeping',
    'Socializing',
    'Sewing',
    'Golf',
    'Church Activities',
    'Relaxing',
    'Playing Music',
    'Housework',
    'Crafts',
    'Watching Sports',
    'Bicycling',
    'Playing Cards',
    'Hiking',
    'Cooking',
    'Eating Out',
    'Dating Online',
    'Swimming',
    'Camping',
    'Skiing',
    'Working on Cars',
    'Writing',
    'Boating',
    'Motorcycling',
    'Animal Care',
    'Bowling',
    'Painting',
    'Running',
    'Dancing',
    'Horseback Riding',
    'Tennis',
    'Theater',
    'Billiards',
    'Beach',
    'Volunteer Work',
];

const major = ['Arts', 'Commerce', 'Computer Science', 'Engineering', 'Land and Food Systems', 'Music', 'Science'];

const university = [
    'University of British Columbia',
    'Simon Fraser University',
    'University of Victoria',
    'Capilano University',
    'UBC Okanagan',
];

const generateMentrData = (startIndex, count) => {
    const data = [];

    // TODO FB and interests
    for (i = startIndex; i <= startIndex + count; i++) {
        const curr = {};
        curr.id = i;
        curr.firstName = Faker.name.firstName();
        curr.lastName = Faker.name.lastName();
        curr.year = Faker.random.number({ min: 1, max: 5 });
        curr.major = Faker.random.arrayElement(major);
        curr.university = Faker.random.arrayElement(university);
        curr.email = Faker.internet.email(curr.firstName.toLowerCase(), curr.lastName.toLowerCase());
        curr.phone = Faker.phone.phoneNumberFormat(1).split('x')[0];
        curr.facebook = `facebook.com/${curr.firstName.toLowerCase()}.${curr.lastName.toLowerCase()}${Faker.random.number(
            {
                min: 0,
                max: 999,
            }
        )}`;
        const currInterests = [];
        for (j = 0; j < 3; j++) {
            currInterests.push(Faker.random.arrayElement(interest));
        }
        curr.interests = currInterests;
        curr.bio = `${Faker.random.arrayElement(greeting)} I am ${curr.firstName}, I study ${curr.major} at ${
            curr.university
        }.`;

        data.push(curr);
    }

    return data;
};

module.exports = generateMentrData;
