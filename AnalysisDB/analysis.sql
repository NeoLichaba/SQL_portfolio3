create database analysis;

CREATE TABLE teachers (
 id bigserial,
 first_name varchar(25),
 last_name varchar(50),
 school varchar(50),
 hire_date date,
 salary numeric
);

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
 ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
 ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
 ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
 ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
 ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
 
SELECT * from teachers;

SELECT first_name, last_name, school from teachers;

SELECT DISTINCT school 
from teachers;


SELECT DISTINCT school, salary
from teachers;

SELECT DISTINCT school, salary
from teachers
ORDER BY salary DESC;

SELECT DISTINCT last_name, school, hire_date
from teachers
ORDER BY school ASC, hire_date DESC;

SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

SELECT first_name, last_name, salary
from teachers
where salary > 50000;

SELECT first_name, last_name, salary
from teachers
where salary BETWEEN 20000 and 40000;

SELECT * 
FROM teachers
WHERE first_name LIKE 'sam%';

SELECT *
FROM teachers
WHERE first_name ILIKE 'sam%';

SELECT *
FROM teachers
WHERE first_name NOT LIKE 'sam%';

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
AND (salary > 38000 OR salary > 45000);

SELECT *
FROM teachers
WHERE last_name= 'Cole'
OR last_name='Bush';

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
AND (salary BETWEEN 38000 AND 90000);

CREATE database try_it_yourself;
__________________________________________________________

CREATE TABLE char_data_types (
 varchar_column varchar(10),
 char_column char(10),
 text_column text 
);

INSERT INTO char_data_types
VALUES 
 ('abc', 'abc', 'abc'),
 ('defghi', 'defghi', 'defghi')


 COPY char_data_types TO 'C:\Users\User\Documents\Analysis_PostgreSQL\typetest.txt'WITH (FORMAT CSV, HEADER, DELIMITER '|');
 
 COPY teachers TO 'C:\Users\User\Documents\Analysis_PostgreSQL\typetest1.txt'WITH (FORMAT CSV, HEADER, DELIMITER '|');
 
 ____________________________________________________________________________
 
SELECT 
 	timestamp_column, 
	interval_column, 
	timestamp_column - interval_column AS new_date
FROM date_time_types;

SELECT timestamp_column, CAST(timestamp_column AS varchar(10))
FROM date_time_types;

SELECT numeric_column, 
 CAST(numeric_column AS integer), 
 CAST(numeric_column AS varchar(6)) 
FROM number_data_types; 

SELECT CAST(char_column AS integer) FROM char_data_types;