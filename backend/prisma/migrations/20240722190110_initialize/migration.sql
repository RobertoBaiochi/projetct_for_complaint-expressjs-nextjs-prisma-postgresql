-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "biograph" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Avatar" (
    "id" TEXT NOT NULL,
    "pathname" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "Avatar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Banner" (
    "id" TEXT NOT NULL,
    "pathname" TEXT NOT NULL,
    "complaint_threads_id" TEXT NOT NULL,

    CONSTRAINT "Banner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComplaintSent" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "complaint_threads_id" TEXT NOT NULL,

    CONSTRAINT "ComplaintSent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComplaintRecived" (
    "id" TEXT NOT NULL,
    "complaint" TEXT NOT NULL,
    "helped" BOOLEAN NOT NULL,
    "complaint_answer_id" TEXT NOT NULL,
    "created_at" TEXT NOT NULL,
    "complaint_threads_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "ComplaintRecived_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComplaintThreads" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "ComplaintThreads_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComplaintAnswer" (
    "id" TEXT NOT NULL,
    "complaint_threads_id" TEXT NOT NULL,

    CONSTRAINT "ComplaintAnswer_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Avatar_user_id_key" ON "Avatar"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Banner_complaint_threads_id_key" ON "Banner"("complaint_threads_id");

-- AddForeignKey
ALTER TABLE "Avatar" ADD CONSTRAINT "Avatar_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Banner" ADD CONSTRAINT "Banner_complaint_threads_id_fkey" FOREIGN KEY ("complaint_threads_id") REFERENCES "ComplaintThreads"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplaintSent" ADD CONSTRAINT "ComplaintSent_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplaintSent" ADD CONSTRAINT "ComplaintSent_complaint_threads_id_fkey" FOREIGN KEY ("complaint_threads_id") REFERENCES "ComplaintThreads"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplaintRecived" ADD CONSTRAINT "ComplaintRecived_complaint_answer_id_fkey" FOREIGN KEY ("complaint_answer_id") REFERENCES "ComplaintAnswer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplaintRecived" ADD CONSTRAINT "ComplaintRecived_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplaintRecived" ADD CONSTRAINT "ComplaintRecived_complaint_threads_id_fkey" FOREIGN KEY ("complaint_threads_id") REFERENCES "ComplaintThreads"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplaintThreads" ADD CONSTRAINT "ComplaintThreads_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplaintAnswer" ADD CONSTRAINT "ComplaintAnswer_complaint_threads_id_fkey" FOREIGN KEY ("complaint_threads_id") REFERENCES "ComplaintThreads"("id") ON DELETE CASCADE ON UPDATE CASCADE;
