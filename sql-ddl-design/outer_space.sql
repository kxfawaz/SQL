-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "Planets"(
    "id" BIGINT NOT NULL,
    "planet_name" TEXT NOT NULL
);
ALTER TABLE
    "Planets" ADD PRIMARY KEY("id");
CREATE TABLE "Galaxy"(
    "id" BIGINT NOT NULL,
    "Galaxy_name" BIGINT NOT NULL,
    "planet_id" BIGINT NOT NULL
);
ALTER TABLE
    "Galaxy" ADD PRIMARY KEY("id");
CREATE TABLE "Orbits"(
    "id" BIGINT NOT NULL,
    "planet_id" BIGINT NOT NULL,
    "star_id" BIGINT NOT NULL,
    "orbit_period_in_years" BIGINT NOT NULL
);
ALTER TABLE
    "Orbits" ADD PRIMARY KEY("id");
CREATE TABLE "Stars"(
    "id" BIGINT NOT NULL,
    "name" BIGINT NOT NULL
);
ALTER TABLE
    "Stars" ADD PRIMARY KEY("id");
CREATE TABLE "Moons"(
    "id" BIGINT NOT NULL,
    "moon_name" BIGINT NOT NULL,
    "planet_id" BIGINT NOT NULL
);
ALTER TABLE
    "Moons" ADD PRIMARY KEY("id");
ALTER TABLE
    "Orbits" ADD CONSTRAINT "orbits_planet_id_foreign" FOREIGN KEY("planet_id") REFERENCES "Planets"("id");
ALTER TABLE
    "Orbits" ADD CONSTRAINT "orbits_star_id_foreign" FOREIGN KEY("star_id") REFERENCES "Stars"("id");
ALTER TABLE
    "Moons" ADD CONSTRAINT "moons_planet_id_foreign" FOREIGN KEY("planet_id") REFERENCES "Planets"("id");
ALTER TABLE
    "Galaxy" ADD CONSTRAINT "galaxy_planet_id_foreign" FOREIGN KEY("planet_id") REFERENCES "Planets"("id");