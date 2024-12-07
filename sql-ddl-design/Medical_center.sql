CREATE TABLE "Doctor"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "New column" BIGINT NOT NULL
);
ALTER TABLE
    "Doctor" ADD PRIMARY KEY("id");
CREATE TABLE "Patients"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "Patients" ADD PRIMARY KEY("id");
CREATE TABLE "Disease Table"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "descriptiobigintn" TEXT NOT NULL
);
ALTER TABLE
    "Disease Table" ADD PRIMARY KEY("id");
CREATE TABLE "visits"(
    "id" BIGINT NOT NULL,
    "doctor_id" BIGINT NOT NULL,
    "patient_id" BIGINT NOT NULL,
    "visit_date" BIGINT NOT NULL
);
ALTER TABLE
    "visits" ADD PRIMARY KEY("id");
CREATE TABLE "Patient_Disease"(
    "id" BIGINT NOT NULL,
    "visit_id" BIGINT NOT NULL,
    "patient_id" BIGINT NOT NULL,
    "doctor_id" BIGINT NOT NULL
);
ALTER TABLE
    "Patient_Disease" ADD PRIMARY KEY("id");
ALTER TABLE
    "Patient_Disease" ADD CONSTRAINT "patient_disease_visit_id_foreign" FOREIGN KEY("visit_id") REFERENCES "visits"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_doctor_id_foreign" FOREIGN KEY("doctor_id") REFERENCES "Doctor"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "Patients"("id");