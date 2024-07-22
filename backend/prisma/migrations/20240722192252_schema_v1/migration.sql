/*
  Warnings:

  - The `created_at` column on the `ComplaintRecived` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[id]` on the table `Avatar` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Banner` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `ComplaintAnswer` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `ComplaintRecived` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `ComplaintSent` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `ComplaintThreads` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "ComplaintRecived" DROP COLUMN "created_at",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "ComplaintThreads" ALTER COLUMN "created_at" SET DEFAULT CURRENT_TIMESTAMP;

-- CreateIndex
CREATE UNIQUE INDEX "Avatar_id_key" ON "Avatar"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Banner_id_key" ON "Banner"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ComplaintAnswer_id_key" ON "ComplaintAnswer"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ComplaintRecived_id_key" ON "ComplaintRecived"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ComplaintSent_id_key" ON "ComplaintSent"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ComplaintThreads_id_key" ON "ComplaintThreads"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
