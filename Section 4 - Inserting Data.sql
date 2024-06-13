-- Section 4: Inserting Data
CREATE TABLE cats (
name VARCHAR(50) NOT NULL,
age INT NOT NULL);

CREATE TABLE dogs (
name VARCHAR(50) NOT NULL,
breed VARCHAR(50) NOT NULL,
age INT NOT NULL); 

INSERT INTO cats(name, age)
VALUES ("Blue Steele", 5);

INSERT INTO cats(name, age)
VALUES ("Barney", 3);

INSERT INTO cats(name, age)
VALUES ("Barney", 3),
("Finn", 18),
("Bridget", 12);

Select * from  cats;

CREATE TABLE unique_dogs (
dog_id int AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT NOT NULL);

SELECT * FROM unique_dogs;