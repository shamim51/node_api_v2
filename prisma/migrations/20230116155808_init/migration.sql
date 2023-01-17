-- CreateEnum
CREATE TYPE "UPDATE_STATUS_v2" AS ENUM ('IN_PROGRESS', 'LIVE', 'DEPRECATED', 'ARCHIVED');

-- CreateTable
CREATE TABLE "User_v2" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_v2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product_v2" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "belongsToId" TEXT NOT NULL,

    CONSTRAINT "Product_v2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Update_v2" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "body" TEXT NOT NULL,
    "status" "UPDATE_STATUS_v2" NOT NULL DEFAULT 'IN_PROGRESS',
    "version" TEXT,
    "asset" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "user_v2Id" TEXT,

    CONSTRAINT "Update_v2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UpdatePoint_v2" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "updateId" TEXT NOT NULL,

    CONSTRAINT "UpdatePoint_v2_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_v2_username_key" ON "User_v2"("username");

-- AddForeignKey
ALTER TABLE "Product_v2" ADD CONSTRAINT "Product_v2_belongsToId_fkey" FOREIGN KEY ("belongsToId") REFERENCES "User_v2"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Update_v2" ADD CONSTRAINT "Update_v2_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product_v2"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Update_v2" ADD CONSTRAINT "Update_v2_user_v2Id_fkey" FOREIGN KEY ("user_v2Id") REFERENCES "User_v2"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UpdatePoint_v2" ADD CONSTRAINT "UpdatePoint_v2_updateId_fkey" FOREIGN KEY ("updateId") REFERENCES "Update_v2"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
