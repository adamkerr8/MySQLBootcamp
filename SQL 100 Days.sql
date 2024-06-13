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

-- Section 6 - CRUD Basics

CREATE TABLE employees (
id INT AUTO_INCREMENT PRIMARY KEY,
last_name VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
middle_name VARCHAR(100),
age INT NOT NULL,
current_status VARCHAR(100) NOT NULL DEFAULT 'employed');


INSERT INTO employees (last_name, first_name, middle_name, age)
VALUES ("Kerr", "Adam", NULL, 24);

SELECT * FROM employees;


CREATE TABLE books (
book_id INT AUTO_INCREMENT,
title VARCHAR(100),
author_fname VARCHAR(100),
author_lname VARCHAR(100),
released_year INT,
stock_quantity INT,
pages INT,
PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES 
('The namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945,95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- String Functions

SELECT CONCAT('pi', 'ckle');
SELECT CONCAT(author_fname, ' ', author_lname) AS author_name FROM books;
SELECT CONCAT_WS('-', title, author_fname, author_lname) FROM books;

SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING('Hello World', 7);
SELECT SUBSTRING('Hello World', -3);
SELECT SUBSTRING(title,1 ,10) AS 'short title' FROM books;
SELECT SUBSTR(title,1 ,10) AS 'short title' FROM books;

SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('Hello World', 'l', '7');
SELECT REPLACE('Hello World', 'o', '0');
SELECT REPLACE('Hello World', 'o', '*');
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE(title, 'e ', '3') FROM books;
SELECT REPLACE(title, ' ', '-') FROM books;

SELECT REVERSE('Hello World');
SELECT REVERSE('meow meow');
SELECT REVERSE(author_fname) FROM books;
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

SELECT CHAR_LENGTH('Hello World');
SELECT CHAR_LENGTH(title) as length, title FROM books;
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT CONCAT(autho_lname, ' is ', CHAR_LENGTH(author_lname), 'characters long') FROM books;

SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVOURITE BOOK IS ', UPPER(title)) FROM books;
SELECT CONCAT('MY FAVOURITE BOOK IS ', LOWER(title)) FROM books;

SELECT INSERT('Hello Bobby', 6, 0, 'There');
SELECT LEFT('omghahalol!', 3);
SELECT RIGHT('omghahalol!', 4);
-- SELECT REPEAT('ha', 4); 
SELECT TRIM('  pickle  ');

SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));
SELECT REPLACE(title, ' ', '->') AS title FROM books;
SELECT 
	author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
	books;
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;
SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;
SELECT title, CHAR_LENGTH(title) AS character_count FROM books;
SELECT 
	CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
	books;
    
INSERT INTO books
	(title, author_fname, author_lname, released_year, stock_quantity, pages)
	VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
		   ('fake_book', 'Freida', 'Harris', 2001, 287, 428)
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT author_lname FROM books;
SELECT DISTINCT author_lname FROM books;
SELECT author_fname, author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

SELECT * FROM books
ORDER BY author_lname;
SELECT * FROM books
ORDER BY author_lname DESC;
SELECT * FROM books
ORDER BY released_year;

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 2 desc;
SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname, author_fname;

-- Refining Selections

SELECT title FROM books LIMIT 3;
SELECT title FROM books LIMIT 1;
SELECT title FROM books LIMIT 10;
SELECT * FROM books LIMIT 1;
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;
SELECT * FROM tbl LIMIT 95,362785148458792654;
SELECT title FROM books LIMIT 5, 50;

SELECT title, author_fname, author_lname, pages
FROM books
WHERE author_fname LIKE '%da%';
SELECT title, author_fname, author_lname, pages
FROM books
WHERE author_fname LIKE '%:%';
SELECT * FROM books
WHERE author_fname LIKE '_____';
SELECT * FROM books
WHERE author_fname LIKE '__a__';

-- To select books with a '%' in their title:
SELECT * FROM books
WHERE title LIKE '%\%%';
-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';

SELECT title FROM books WHERE title LIKE '%stories%';
SELECT title FROM books ORDER BY pages DESC LIMIT 1;
SELECT CONCAT(title, ' - ', released_year) AS summary
	FROM books ORDER BY released_year DESC LIMIT 3;
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title, released_year, stock_quantity
FROM books ORDER BY stock_quantity LIMIT 3;
SELECT title, author_lname
FROM books ORDER BY stock_quantity LIMIT 3;
SELECT title, author_lname
FROM books ORDER BY 2,1;
SELECT 
	CONCAT(
		'MY FAVOURITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
	) AS yell
FROM books ORDER BY author_lname;

-- COUNT
SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;

-- Aggreagte Functions

SELECT author_lname, COUNT(*)
FROM books
GROUP BY author_lname;

-- ORDER BY 
SELECT author_lname, COUNT(*) AS books_written FROM books
GROUP BY author_lname
ORDER BY books_written DESC;

-- MIN / MAX
SELECT MAX(pages) FROM books;
SELECT MIN(author_lname) FROM books;

-- Subqueries
SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT MIN(released_year) FROM books;

SELECT title, released_year FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);

-- Grouping By Multiple Columns
SELECT author_fname, author_lname, COUNT(*) FROM books
GROUP  BY author_lname, author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*) FROM books
GROUP BY author;

-- MIN / MAX with GROUP BY
SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;
SELECT 
	author_lname, 
    COUNT(*) as books_written,
    MAX(released_year) as latest_year, 
    MIN(released_year) as earliest_year,
    MAX(pages) as longest_page_count
FROM books GROUP BY author_lname;

SELECT 
	author_lname,
    author_fname,
    COUNT(*) as books_written,
    MAX(released_year) as latest_year, 
    MIN(released_year) as earliest_year
FROM books GROUP BY author_lname;

-- SUM
SELECT SUM(pages) FROM books;
SELECT author_lname, COUNT(*), SUM(pages) FROM books
GROUP BY author_lname;

-- AVG
SELECT AVG(pages) FROM books;
SELECT AVG(released_year) FROM books;
SELECT 
	released_year,
    AVG(stock_quantity),
    COUNT(*) FROM books
GROUP BY released_year;

-- ACTIVITY (Agg Functions Exercise) (SOLUTION)
SELECT COUNT(*) FROM books;
SELECT released_year, COUNT(*) FROM books Group BY released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT AVG(released_year) From books GROUP BY author_fname, author_lname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books ORDER BY pages DESC LIMIT 1;
SELECT 
	released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books GROUP BY released_year ORDER BY released_year;

-- Time + Date
CREATE TABLE people (
	name varchar(100),
    birthdate DATE,
	birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

-- DATE Functions
SELECT 
	birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;

SELECT 
	birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;

-- TIME Functions
SELECT
	birthtime,
    HOUR(birthtime)<
    MINUTE(birthtime)
FROM people;

SELECT 
	birthdt,
    MONTH(birthdt),
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;

-- Formatting Dates
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

-- Date Math
CREATE TABLE captions (
	text varchar(150),
    created_at TIMESTAMP default CURRENT_TIMESTAMP
);

CREATE TABLE carptions2 (
	text VARCHAR(150),
    created_at TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Exercise
-- Whats a good use case for CHAR?
-- Used for text that we know has a fixed length, e.g. US STate abbreviations/abbreviated company names etc
CREATE TABLE inventory (
	item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT 
);
-- What's the difference between DATETIME and TIMESTAMP?
-- They both store datetime info, but diff in the range. TIMESTAMP also takes up less space
-- TIMESTAMP is used for things like meta-data about when something is created or updated

SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;

SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');

SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');

CREATE TABLE tweets (
	content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tweets (content, username) VALUES ('this is my first tweet', 'coltscat');
SELECT * FROM tweets;

INSERT INTO tweets (content, username) VALUES ('this is my second tweet', 'coltscat');
SELECT * FROM tweets;

-- Comparison + Logical Operators
-- Not equals
SELECT * FROM books
WHERE released_year != 2017;

-- NOT LIKE
SELECT * from books
WHERE title NOT LIKE '%e%';

-- Greater than
SELECT * from books
WHERE released_year > 2005;

SELECT * from books
WHERE pages > 500;

-- Less than
SELECT * from books
WHERE released_year < 2000;

SELECT * from books
WHERE pages < 500;

SELECT * from books
WHERE released_year <= 1985;

-- Logical AND
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';

SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';

-- Logical OR
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Eggers' OR 
released_year > 2010;

-- Between
SELECT title, author_lname, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;

-- Comparing Dates
SELECT * FROM people WHERE birthtime BETWEEN CAST('12:00:00' AS TIME) AND CAST('16:00:00' AS TIME);
SELECT * FROM people WHERE HOUR(birthtime) BETWEEN 12 AND 16;

-- IN Operator
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

-- CASE Statements
SELECT 
	title,
    stock_quantity,
    CASE
		WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
		WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
		WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
		WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
	END AS stock
FROM books;

-- EXERCISE 
SELECT * FROM books WHERE released_year < 1980;
SELECT * FROM books 
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';

SELECT * FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;

SELECT * FROM books
WHERE pages >= 100 AND pages <= 200;

SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');

SELECT title, author_lname,
CASE
	WHEN title LIKE '%stories%' THEN 'Short stories'
    WHEN title = 'Juts Kids' THEN 'Memoir'
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
    ELSE 'Novel'
END AS type
FROM books;

SELECT author_fname, author_lname,
	CASE 
		WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

-- Constraints and ALTER TABLE
-- UNIQUE Contsraint
CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
-- If this ^ was repeated, it would result in an error as phone number would not be unique second time around

-- CHECK Constraints
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

CREATE TABLE palindromes (
	word VARCHAR(100) CHECK(REVERSE(word) = word)
);

-- Named Contsraints
CREATE TABLE users2 (
	username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >=0)
);

CREATE TABLE palindromes2 (
	word VARCHAR(100),
    CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

-- Multiple Column Constraints
CREATE TABLE companies (
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	CONSTRAINT name_adress UNIQUE (name, address)
);

CREATE TABLE houses (
	purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT sprice_gt_pprice CHECK (sale_price >= purchase_price)
);

-- ALTER TABLE: Adding Columns
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies 
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- ALTER TABLE: Dropping Columns
ALTER TABLE companies
DROP COLUMN phone;

-- ALTER TABLE: Renaming Tables
RENAME TABLE companies to suppliers;
ALTER TABLE suppliers RENAME to companies;
ALTER TABLE companies
RENAME COLUMN name to company_name;

-- ALTER TABLE: Modifying Columns
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

-- ALTER TABLE: Constraints
ALTER TABLE houses
ADD CONSTRAINT positive_pprice CHECK (purhcase_price >= 0);

ALTER TABLE houses DROP CONSTRAINT positive_pprice;

-- One to Many Joins
-- Primary + Foreign Keys
CREATE TABLE customers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
	   ('George', 'Michael', 'gm@gmail.com'),
	   ('David', 'Bowie', 'david@gmail.com'),
	   ('Blue', 'Steele', 'blue@gmail.com'),
	   ('Bette', 'Davis', 'bette@gmail.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
	   ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
-- Cross Joins
SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;

SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');
-- To perform a (kind of useless) cross join:
SELECT * FROM customers, orders;

-- Inner JOINS
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;

SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON orders.customer_id = customers.id;

-- The order doesn't matter here
SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;

-- Inner JOIN with GROUP BY 
SELECT 
	first_name, last_name, SUM(amount) AS total
FROM
	customers
		JOIN
	orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name
ORDER BY total;

-- LEFT JOIN
SELECT 
	first_name, last_name, order_date, amount
FROM
	customers
		LEFT JOIN
	orders ON orders.customer_id = customers.id;
    
SELECT
	order_date, amount, first_name, last_name
FROM
	orders
		LEFT JOIN
	customers ON orders.customer_id = customers.id;
    
-- LEFT JOIN with GROUP BY
SELECT 
	first_name,
    last_name,
    IFNULL(SUM(amount), 0) AS money_spent
FROM
	customers
		LEFT JOIN 
	orders ON customers.id = orders.customer_id
GROUP BY first_namne, last_name;

-- RIGHT JOIN
SELECT 
	first_name, last_name, order_date, amount
FROM 
	customers
		RIGHT JOIN
	orders ON customers.id = orders.customer_id;
    
-- On Delete Cascade
CREATE TABLE customers (
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50)
);

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
amount DECIMAL(8,2),
customer_id INT,
FOREIGN KEY (customer_id)
REFERENCES customers (id)
ON DELETE CASCADE
);

-- Section 14: Many-to-Many 

-- Creating Many-to-Many Tables
CREATE TABLE reviewers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    released_year YEAR,
    genre VARCHAR(100)
);

CREATE TABLE reviews (
	id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id)
		REFERENCES series (id),
	FOREIGN KEY (reviewer_id)
		REFERENCES reviewers (id)
);

INSERT INTO series (title, released_year, genre) VALUES 
('Archer', 2009, 'Animation'), 
('Arrested Development', 2003, 'Comedy'), 
("Bob's Burgers", 2011, 'Animation'), 
('Bojack Horseman', 2014, 'Animation'), 
('Breaking Bad', 2008, 'Drama'), 
('Curb Your Enthusiasm', 2000, 'Comedy'), 
('Fargo', 2014, 'Drama'), 
('Freaks and Geeks', 1999, 'Comedy'), 
('General Hospital', 1963, 'Drama'), 
('Halt and Catch Fire', 2014, 'Drama'), 
('Malcolm In The Middle', 2000, 'Comedy'), 
('Pushing Daisies', 2007, 'Comedy'), 
('Seinfeld', 1989, 'Comedy'), 
('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES 
	('Thomas', 'Stoneman'), 
	('Wyatt', 'Skaggs'), 
    ('Kimbra', 'Masters'), 
    ('Domingo', 'Cortes'), 
    ('Colt', 'Steele'), 
    ('Pinkie', 'Petit'), 
	('Marlon', 'Crafford');


INSERT INTO reviews (series_id, reviewer_id, rating) VALUES 
	(1,1,8.0), (1,2,7.5) , (1,3,8.5) , (1,4,7.7) , (1,5,8.9), 
    (2,1,8.1), (2,4,6.0), (2,3,8.0), (2,6,8.4) , (2,5,9.9), 
    (3,1,7.0), (3,6,7.5), (3, 4,8.0), (3,3,7.1), (3,5,8.0), 
    (4,1,7.5), (4,3,7.8), (4,4,8.3), (4,2,7.6), (4,5,8.5), 
    (5,1,9.5), (5,3,9.0), (5,4,9.1), (5,2,9.3), (5,5,9.9), 
    (6,2,6.5), (6,3,7.8), (6,4,8.8), (6,2,8.4), (6,5,9.1) , 
    (7,2,9.1), (7,5,9.7), (8,4,8.5), (8,2,7.8), (8,6,8.8), (8,5,9.3), 
    (9,2,5.5), (9,3,6.8), (9,4,5.8), (9,6,4.3), (9,5,4.5), (10,5,9.9), 
    (13,3,8.0), (13,4,7.2), (14,2,8.5), (14,3,8.9), (14,4,8.9);
    
-- Challenge
SELECT 
	title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
	reviewers
		INNER JOIN
	series ON reviews.series_id = series.id
		INNER JOIN
	reviewers ON reviews.reviewer_id = reviewers.id;
    
SELECT
	title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
	series
		INNER JOIN
	reviews ON reviews.series_id = series.id
		INNER JOIN
	reviewers ON reviews.reviewer_id = reviewers.id;
    
SELECT
	title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
	reviewers
		INNER JOIN
	reviews ON reviews.reviewer_id = reviewers.id
		INNER JOIN
	series ON reviews.series_id = series.id;
    
    
-- Intro to Views
-- Instead of this:
SELECT 
	title, released_year, genre, rating, first_name, last_name
FROM
	reviews
		JOIN
	series ON series.id = reviews.series.id
		JOIN
	reviewers ON reviewers.id = reviews.reviewer_id;
    
-- We can create a view like this:
CREATE VIEW full_reviews AS
SELECT 
	title, released_year, genre, rating, first_name, last_name
FROM
	reviews
		JOIN
	series ON series.id = reviews.series.id
		JOIN
	reviewers ON reviewers.id = reviews.reviewer_id;
    
-- ^ This can now be treated as a temporary table that we can select from

-- Updating/Replacing/Altering Views
CREATE VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year;

CREATE OR REPLACE VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year DESC;

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

DROP VIEW ordered_series;

-- HAVING clause ****
SELECT 
	title,
    AVG(rating),
    COUNT(rating) AS review_count
FROM full_reviews
GROUP BY title HAVING COUNT(rating) > 1;

-- WITH ROLLUP
SELECT 
	title, AVG(rating)
FROM 
	full_reviews
GROUP BY title WITH ROLLUP;

SELECT
	title, COUNT(rating)
FROM
	full_reviews
GROUP BY title WITH ROLLUP;

SELECT 
	first_name, released_year, genre, AVG(rating)
FROM
	full_reviews
GROUP BY released_year, genre, first_name WITH ROLLUP;

-- To view modes:
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

SET GLOBAL sql_mode = 'modes';
SET SESSION sql_mode = 'modes';


-- Intro to Window Functions
-- Using OVER()
CREATE TABLE employees (
	emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;

SELECT 
	emp_no,
    department,
    salary,
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;

SELECT emp_no, department, salary, MIN(salary), MAX(salary)  FROM employees;

-- Partition By
SELECT 
	emp_no,
	department,
	salary,
	AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;

SELECT 
	emp_no,
	department,
	salary,
    COUNT(*) OVER(PARTITION BY department) AS dept_count
FROM employees;

SELECT 
	emp_no,
	department,
	salary,
    SUM(salary) OVER(PARTITION BY department) AS debt_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;

-- ORDER BY with Windows
SELECT 
	emp_no,
	department,
	salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS total_dept_salary
FROM employees;

SELECT 
	emp_no,
	department,
	salary,
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS rolling_min
FROM employees;

-- RANK(), DENSE_RANK & ROW_NUMBER()
SELECT 
	emp_no,
    department,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) AS overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS overall_num
    FROM employees
    ORDER BY overall_rank;
    
-- NTILE()
SELECT 
	emp_no,
    department,
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
    NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- FIRST_VALUE
SELECT 
	emp_no,
    department,
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) AS highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) AS highest_paid_overall
FROM employees;

-- LEAD and LAG
SELECT 
	emp_no,
    department,
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) AS salary_diff
FROM employees;

SELECT 
	emp_no,
    department,
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_diff
    FROM employees;