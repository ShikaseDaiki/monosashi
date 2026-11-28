-- CreateTable
CREATE TABLE "classification_schemes" (
    "id" TEXT NOT NULL,
    "user_id" TEXT,
    "name" VARCHAR(30) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "classification_schemes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "axes" (
    "id" TEXT NOT NULL,
    "classification_scheme_id" TEXT NOT NULL,
    "name" VARCHAR(10) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "axes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "axis_options" (
    "id" TEXT NOT NULL,
    "axis_id" TEXT NOT NULL,
    "name" VARCHAR(10) NOT NULL,
    "isPositive" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "axis_options_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "domains" (
    "id" TEXT NOT NULL,
    "vertical_axis_id" TEXT NOT NULL,
    "horizontal_axis_id" TEXT NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "domains_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "classification_schemes" ADD CONSTRAINT "classification_schemes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "axes" ADD CONSTRAINT "axes_classification_scheme_id_fkey" FOREIGN KEY ("classification_scheme_id") REFERENCES "classification_schemes"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "axis_options" ADD CONSTRAINT "axis_options_axis_id_fkey" FOREIGN KEY ("axis_id") REFERENCES "axes"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "domains" ADD CONSTRAINT "domains_vertical_axis_id_fkey" FOREIGN KEY ("vertical_axis_id") REFERENCES "axes"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "domains" ADD CONSTRAINT "domains_horizontal_axis_id_fkey" FOREIGN KEY ("horizontal_axis_id") REFERENCES "axes"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

