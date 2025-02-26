-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

CREATE TABLE "Passengers"(
    "id" BIGINT NOT NULL,
    "first_name" BIGINT NOT NULL,
    "last_name" BIGINT NOT NULL
);
ALTER TABLE
    "Passengers" ADD PRIMARY KEY("id");
CREATE TABLE "Seats"(
    "id" BIGINT NOT NULL,
    "passenger_id" BIGINT NOT NULL,
    "airline_id" BIGINT NOT NULL
);
ALTER TABLE
    "Seats" ADD PRIMARY KEY("id");
CREATE TABLE "Airline"(
    "id" BIGINT NOT NULL,
    "name" BIGINT NOT NULL
);
ALTER TABLE
    "Airline" ADD PRIMARY KEY("id");
CREATE TABLE "Flights"(
    "id" BIGINT NOT NULL,
    "from_city" TEXT NOT NULL,
    "to_city" TEXT NOT NULL,
    "from_country" TEXT NOT NULL,
    "to_country" TEXT NOT NULL,
    "airline_id" BIGINT NOT NULL
);
ALTER TABLE
    "Flights" ADD PRIMARY KEY("id");
CREATE TABLE "Time"(
    "id" BIGINT NOT NULL,
    "flight_id" BIGINT NOT NULL,
    "departure" DATE NOT NULL,
    "arrival" DATE NOT NULL
);
ALTER TABLE
    "Time" ADD PRIMARY KEY("id");
ALTER TABLE
    "Flights" ADD CONSTRAINT "flights_airline_id_foreign" FOREIGN KEY("airline_id") REFERENCES "Airline"("id");
ALTER TABLE
    "Seats" ADD CONSTRAINT "seats_passenger_id_foreign" FOREIGN KEY("passenger_id") REFERENCES "Passengers"("id");
ALTER TABLE
    "Seats" ADD CONSTRAINT "seats_airline_id_foreign" FOREIGN KEY("airline_id") REFERENCES "Airline"("name");
ALTER TABLE
    "Time" ADD CONSTRAINT "time_flight_id_foreign" FOREIGN KEY("flight_id") REFERENCES "Flights"("id");

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');