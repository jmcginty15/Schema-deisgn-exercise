-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE city (
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_id INTEGER REFERENCES country NOT NULL
);

CREATE TABLE airline (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE flight (
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airline NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city_id INTEGER REFERENCES city NOT NULL,
  to_city_id INTEGER REFERENCES city NOT NULL
);

CREATE TABLE passenger (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT NOT NULL
);

CREATE TABLE ticket (
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passenger NOT NULL,
  flight_id INTEGER REFERENCES flight NOT NULL,
  seat VARCHAR(3) NOT NULL
);

INSERT INTO country
  (country_name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile');

INSERT INTO city
  (city_name, country_id)
VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('Los Angeles', 1),
  ('Seattle', 1),
  ('Paris', 3),
  ('Dubai', 4),
  ('New York', 1),
  ('Cedar Rapids', 1),
  ('Charlotte', 1),
  ('Sao Paolo', 5),
  ('London', 6),
  ('Las Vegas', 1),
  ('Mexico City', 7),
  ('Casablanca', 8),
  ('Beijing', 9),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Santiago', 10);

INSERT INTO airline
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO flight
  (airline_id, departure, arrival, from_city_id, to_city_id)
VALUES
  (1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 4),
  (2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 11),
  (3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 12),
  (3, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 4, 13),
  (4, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 5, 14),
  (5, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 6, 15),
  (1, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 9),
  (6, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 8, 16),
  (6, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 9, 17),
  (7, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 10, 18);

INSERT INTO passenger
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbles');

INSERT INTO ticket
  (passenger_id, flight_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (1, 4, '20A'),
  (4, 5, '23D'),
  (2, 6, '18C'),
  (5, 7, '9E'),
  (6, 8, '1A'),
  (5, 9, '32B'),
  (7, 10, '10D');
