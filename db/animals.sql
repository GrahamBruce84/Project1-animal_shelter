DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE animals (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
age INT8,
type VARCHAR(255),
breed VARCHAR(255),
admission_date DATE
);

CREATE TABLE owners (
id SERIAL8 PRIMARY KEY,
first_name VARCHAR(255),
second_name VARCHAR(255),
address VARCHAR(255)
);

CREATE TABLE adoptions (
id SERIAL8 PRIMARY KEY,
animal_id INT8 REFERENCES animals(id),
owner_id INT8 references owners(id)
);