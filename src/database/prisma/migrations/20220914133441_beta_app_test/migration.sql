-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'CLIENT');

-- CreateEnum
CREATE TYPE "Payment_Status" AS ENUM ('PENDING', 'PAID');

-- CreateEnum
CREATE TYPE "Profile_Roles" AS ENUM ('ADMIN', 'CLIENT');

-- CreateTable
CREATE TABLE "profile" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'CLIENT',

    CONSTRAINT "profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "file" (
    "id" SERIAL NOT NULL,
    "profile_id" INTEGER NOT NULL,
    "file_path" TEXT NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "create_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "payment" (
    "id" SERIAL NOT NULL,
    "payload_id" TEXT NOT NULL,
    "profile_id" INTEGER NOT NULL,
    "file_path" TEXT NOT NULL,
    "status" "Payment_Status" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "payment_status" (
    "id" SERIAL NOT NULL,
    "payment_status" "Payment_Status" NOT NULL,

    CONSTRAINT "payment_status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profile_roles" (
    "id" SERIAL NOT NULL,
    "profile_role" "Profile_Roles" NOT NULL,

    CONSTRAINT "profile_roles_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "profile_email_key" ON "profile"("email");

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
