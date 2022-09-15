const { Prisma, Payment_Status } = require('@prisma/client');

const profile = [
    {
        id: 1,
        name: 'John Doe',
        email: 'johndoe@prisma.io',
        password: 'password',
        phone: '1234567890',
        role: 'ADMIN'
    }
]

const file = [
    {
        id: 1,
        profile_id: 1,
        file_path: 'https://www.google.com',
        description: 'This is a test file',
        created_at: new Date(),
    }
]

const payment = [
    {
        id: 1,
        payload_id: '1234567890',
        profile_id: 1,
        filePath: 'https://www.google.com/image.png',
        status: Payment_Status.PENDING,
        created_at: new Date(),
    }
]

const paymentStatus = [
    {
        id: 1,
        payment_status: 'PENDING',
        created_at: new Date(),
    }
]

const profileRoles = [
    {
        id: 1,
        profileRole: 'ADMIN',
    }
]

module.exports = {
    profile,
    file,
    payment,
    paymentStatus,
    profileRoles,
};