DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE medical_center (
    id SERIAL PRIMARY KEY,
    center_name TEXT NOT NULL
);

CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL,
    center_id INTEGER REFERENCES medical_center
);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL,
    birthdate DATE
);

CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    symptoms TEXT
);

CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctor NOT NULL,
    patient_id INTEGER REFERENCES patient NOT NULL,
    visit_date DATE NOT NULL
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visit,
    disease_id INTEGER REFERENCES disease
);
