CREATE DATABASE IF NOT EXISTS infralabdb;
\c infralabdb

CREATE TABLE IF NOT EXISTS patients (
    patientid SERIAL PRIMARY KEY,
    name VARCHAR(100),
    diagnosis VARCHAR(200)
);

INSERT INTO patients (name, diagnosis) VALUES
('Ola Nordmann', 'Diabetes type 2')
ON CONFLICT DO NOTHING;

INSERT INTO patients (name, diagnosis) VALUES
('Kari Hansen', 'Asthma')
ON CONFLICT DO NOTHING;

SELECT * FROM patients;
