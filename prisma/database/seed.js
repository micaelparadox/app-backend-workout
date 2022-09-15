const { PrismaClient } = require('@prisma/client');
const { profile, file, payment, paymentStatus, profileRoles } = require('./data');
const prisma = new PrismaClient();

const load = async () => {
    try {
        await prisma.profile.createMany({
            data: profile,
            skipDuplicates: true,
        });
        await prisma.file.createMany({
            data: file,
            skipDuplicates: true,
        });
        await prisma.payment.createMany({
            data: payment,
            skipDuplicates: true,
        });
        await prisma.paymentStatus.createMany({
            data: paymentStatus.status === 'PENDING' | 'PAID',
            skipDuplicates: true,
        });
        await prisma.profileRoles.createMany({
            data: profileRoles,
            skipDuplicates: true,
        });
    } catch (error) {
        console.log(error);
    } finally {
        await prisma.$disconnect();
    }
}

load();