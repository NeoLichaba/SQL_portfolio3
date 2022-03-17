-- Database: project3sql



CREATE TABLE my_contacts (
	contact_id bigserial CONSTRAINT contacts_key PRIMARY KEY,
	last_name varchar(50) NOT NULL,
	first_name varchar(50) NOT NULL,
	phone varchar (12) NOT NULL,
	email varchar (100) NOT NULL,
	gender varchar (50) NOT NULL,
	birthday date NOT NULL,
	prof_id INT REFERENCES profession (prof_id) NOT NULL,
	zip_code varchar (4) REFERENCES zip_code (postal_code) NOT NULL,
	status_id bigserial REFERENCES status (status_id),
	interest_id INT NOT NULL,
	seeking_id INT NOT NULL
);	

INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday,prof_id,zip_code,status_id,interest_id,seeking_id)
VALUES ('Parker', 'Cassady', '084546445', 'malesuada@yahoo.com', 'female','1980-01-11','1','1201','1','1','4'),
  ('Wilder', 'Elvis', '0833902858', 'morbi.quis.urna@gmail.com', 'male', '1982-02-14','2','1242','2','2','3'),
  ('McCormick', 'Daquan', '0728435881','cras.eget@outlook.com', 'male', '1984-05-13','3','0850','3','3','2'),
  ('Fox', 'Harlan', '0675091325', 'at.velit@icloud.com', 'female', '1986-04-16','4','0699','4','4','1'),
  ('Green', 'Audrey', '0820116713','pellentesque.tincidunt.tempus@outlook.co.uk', 'female', '1988-05-18','5','2531','5','5','4'),
  ('Fox', 'Shoshana', '0679847045', 'donec@icloud.com', 'male', '1990-06-20','6','8801','6','1','2'),
  ('Thomas', 'Ross', '0731078741','tempus.scelerisque@gmail.com', 'male', '1992-07-22','1','2745','1','2','3'),
  ('Blevins', 'Rhiannon', '0831111222','enim.etiam@hotmail.com', 'female', '1994-08-24','2','9585', '2','3','4'),
  ('Glover', 'Celeste', '0825509758','nullam.suscipit@hotmail.com', 'female','1996-10-25','3','0002','3','3','5'),
  ('Hubbard', 'Donovan', '0844898447', 'semper.pretium@yahoo.com', 'male', '1998-11-26','4', '8801','4','4','5'),
  ('Moore', 'Garth','0827311743','et@google.net', 'male', '2000-12-28','5','5201','1','3','4'),
  ('Harrison', 'Paul','0848853294','velit@icloud.com', 'male', '2002-01-30','6', '8000','2','3','4'),
  ('Jacob', 'Claire','0725068634','egestas.rhoncus@outlook.com', 'female', '2005-01-02','1', '7600','2','3','4'),
  ('Tallulah', 'Fora','0835576512','consequat.purus@icloud.com', 'female', '2000-03-05','2', '6000','2','3','2'),
  ('Carlos', 'Benson','0833186465', 'enim@outlook.com', 'male', '2000-03-14','3','0002','4','5','4');

SELECT * FROM my_contacts;

CREATE TABLE profession (
	prof_id bigserial CONSTRAINT prof_id_key PRIMARY KEY,
	profession varchar (50), 
	CONSTRAINT profession_unique UNIQUE (profession)
);

INSERT INTO profession (profession)
VALUES ('Front End Web Developer'),
	   ('Traditional Healer'),
	   ('Clinical Psychologist'),
	   ('Marketing Manager'),
	   ('Sales Executive'),
	   ('HR Business Partner');

SELECT * FROM profession;

CREATE TABLE zip_code (
	postal_code varchar(4) CONSTRAINT postal_code_key PRIMARY KEY,	
	city varchar (50),
	province varchar (50),
	CONSTRAINT postal_code CHECK (length(postal_code)=4)
);

INSERT INTO zip_code (postal_code,city, province) 
VALUES ('1201','Nelspruit', 'Mpumalanga'),
	   ('1242','Hazyview', 'Mpumalanga'),
	   ('0850','Tzaneen', 'Limpopo'),
	   ('0699','Polokwane', 'Limpopo'),
	   ('2531','Potchefstroom', 'North West'),
	   ('2745','Mahikeng', 'North West'),
	   ('2000','Johannesburg', 'Gauteng'),
	   ('0002','Pretoria', 'Gauteng'),
	   ('9585','Parys', 'Free State'),
	   ('9301','Bloemfontein', 'Free State'),
	   ('8801','Upington', 'Northern Cape'),
	   ('8301','Kimberley', 'Northern Cape'),
	   ('6000','Port Elizabeth', 'Eastern Cape'),
	   ('5201','East London', 'Eastern Cape'),
	   ('7600','Stellenbosch', 'Western Cape'),
	   ('8000','Cape Town', 'Western Cape'),
	   ('4000','Durban', 'KwaZulu Natal'),
	   ('3201','Pietermaritzburg', 'KwaZulu Natal');

SELECT * FROM zip_code;


CREATE TABLE status (
	status_id bigserial CONSTRAINT status_id_key PRIMARY KEY,
	status varchar(25)
);
	
INSERT INTO status (status)
VALUES ('Single'),
	   ('Divorced'),
	   ('Unmarried'),
	   ('It is Complicated'),
	   ('Separated');

SELECT * FROM status;
 
CREATE TABLE contact_interest (
	contact_id bigserial constraint my_contacts_key PRIMARY KEY,
	interest_id INT REFERENCES interest (interest_id)
);

INSERT INTO contact_interest (interest_id)
VALUES ('1'),
	   ('2'),
	   ('3'),
	   ('4'),
	   ('5');
	 
SELECT * FROM contact_interest;

CREATE TABLE contact_seeking (
	contact_id bigserial REFERENCES my_contacts (contact_id),
	seeking_id integer 
);

INSERT INTO contact_seeking (seeking_id)
VALUES ('1'),
	   ('2'),
	   ('3'),
	   ('4'),
	   ('5');

SELECT * FROM contact_seeking;

CREATE TABLE interest (
	interest_id INT CONSTRAINT interest_key PRIMARY KEY,
	interest varchar (50)
);

INSERT INTO interest (interest_id, interest)
VALUES ('1','Current Affairs'),
       ('2','Hiking'),
	   ('3','Interior Decor'),
	   ('4','Wellness'),
	   ('5','Art Collection');
	   
SELECT * FROM interest;

CREATE TABLE seeking (
	seeking_id INT CONSTRAINT contact_seeking_key PRIMARY KEY,
	seeking varchar (50)
);

INSERT INTO seeking (seeking_id,seeking)
VALUES ('1','Male'),
	   ('2','Female'),
	   ('3','Lesbian'),
	   ('4', 'Gay'),
   	   ('5', 'Bisexual');

SELECT * FROM seeking;
   
SELECT 	my_contacts.contact_id, my_contacts.last_name, my_contacts.first_name, 
	my_contacts.phone, my_contacts.email,my_contacts.gender, my_contacts.birthday,
	my_contacts.prof_id,my_contacts.zip_code, my_contacts.status_id, my_contacts.interest_id, my_contacts.seeking_id, profession.prof_id,profession.profession,zip_code.postal_code,zip_code.city,
    zip_code.province,status.status,interest.interest,seeking.seeking
FROM my_contacts
LEFT JOIN profession
ON my_contacts.prof_id=profession.prof_id
LEFT JOIN zip_code
ON my_contacts.zip_code=zip_code.postal_code
LEFT JOIN status
ON my_contacts.status_id=status.status_id
LEFT JOIN interest
ON my_contacts.interest_id=interest.interest_id
LEFT JOIN seeking
ON my_contacts.seeking_id=seeking.seeking_id;


____________________________________________________________________________________

-- ODBC and JDBC Support

--Question 1
-- 1. Find Duplicate Rows in a PostgreSQL Table

SELECT status_id, COUNT(status_id)
FROM my_contacts
GROUP BY status_id
HAVING COUNT(status_id)> 1
ORDER BY status_id;

--Values returned:
-- status_id - 1, 2, 3, 4
--count - 3, 5, 2, 3
__________________________________________________________________________________

-- ODBC and JDBC Support

--Question 2
-- 2. Delete Duplicate Rows Query in a PostgreSQL Table

SELECT * FROM my_contacts;

SELECT contact_id, first_name, last_name, email, 
ROW_NUMBER() OVER
	(PARTITION BY
	 	first_name, last_name, email
	 ORDER BY 
	 	first_name, last_name, email
	) row_num
FROM my_contacts
DELETE FROM cte
WHERE row_num>1;


SELECT * FROM my_contacts;

______________________________________________________________________________

-- ODBC and JDBC Support

--Question 3
-- 3. Create Commands to Set Up PostgreSQL Tables
-- Tables created that contained primary keys: my_contacts (contact_id), profession (prof_id)
-- zip_code(postal_code), status (status_id), contact_interest (contact_id),
-- contact_seeking (contact_id), seeking (seeking_id), interest (interest_id).
-- These tables will hold individual information and will be later merged together
-- into a database


CREATE TABLE my_contacts (
	contact_id bigserial CONSTRAINT contacts_key PRIMARY KEY,
	last_name varchar(50) NOT NULL,
	first_name varchar(50) NOT NULL,
	phone varchar (12) NOT NULL,
	email varchar (100) NOT NULL,
	gender varchar (50) NOT NULL,
	birthday date NOT NULL,
	prof_id INT REFERENCES profession (prof_id) NOT NULL,
	zip_code varchar (4) REFERENCES zip_code (postal_code) NOT NULL,
	status_id bigserial REFERENCES status (status_id),
	interest_id INT NOT NULL,
	seeking_id INT NOT NULL
);	

CREATE TABLE profession (
	prof_id bigserial CONSTRAINT prof_id_key PRIMARY KEY,
	profession varchar (50), 
	CONSTRAINT profession_unique UNIQUE (profession)
);

CREATE TABLE zip_code (
	postal_code varchar(4) CONSTRAINT postal_code_key PRIMARY KEY,	
	city varchar (50),
	province varchar (50),
	CONSTRAINT postal_code CHECK (length(postal_code)=4)
);

CREATE TABLE status (
	status_id bigserial CONSTRAINT status_id_key PRIMARY KEY,
	status varchar(25)
);

CREATE TABLE contact_interest (
	contact_id bigserial constraint my_contacts_key PRIMARY KEY,
	interest_id INT REFERENCES interest (interest_id)
);

CREATE TABLE interest (
	interest_id INT CONSTRAINT interest_key PRIMARY KEY,
	interest varchar (50)
);

CREATE TABLE seeking (
	seeking_id INT CONSTRAINT contact_seeking_key PRIMARY KEY,
	seeking varchar (50)
);

________________________________________________________________________________

-- ODBC and JDBC Support

--Question 4
-- 4. Insert Data into a PostgreSQL Table
-- INSERT values into the respective tables already created 

INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday,prof_id,zip_code,status_id,interest_id,seeking_id)
VALUES ('Parker', 'Cassady', '084546445', 'malesuada@yahoo.com', 'female','1980-01-11','1','1201','1','1','4'),
  ('Wilder', 'Elvis', '0833902858', 'morbi.quis.urna@gmail.com', 'male', '1982-02-14','2','1242','2','2','3'),
  ('McCormick', 'Daquan', '0728435881','cras.eget@outlook.com', 'male', '1984-05-13','3','0850','3','3','2'),
  ('Fox', 'Harlan', '0675091325', 'at.velit@icloud.com', 'female', '1986-04-16','4','0699','4','4','1'),
  ('Green', 'Audrey', '0820116713','pellentesque.tincidunt.tempus@outlook.co.uk', 'female', '1988-05-18','5','2531','5','5','4'),
  ('Fox', 'Shoshana', '0679847045', 'donec@icloud.com', 'male', '1990-06-20','6','8801','6','1','2'),
  ('Thomas', 'Ross', '0731078741','tempus.scelerisque@gmail.com', 'male', '1992-07-22','1','2745','1','2','3'),
  ('Blevins', 'Rhiannon', '0831111222','enim.etiam@hotmail.com', 'female', '1994-08-24','2','9585', '2','3','4'),
  ('Glover', 'Celeste', '0825509758','nullam.suscipit@hotmail.com', 'female','1996-10-25','3','0002','3','3','5'),
  ('Hubbard', 'Donovan', '0844898447', 'semper.pretium@yahoo.com', 'male', '1998-11-26','4', '8801','4','4','5'),
  ('Moore', 'Garth','0827311743','et@google.net', 'male', '2000-12-28','5','5201','1','3','4'),
  ('Harrison', 'Paul','0848853294','velit@icloud.com', 'male', '2002-01-30','6', '8000','2','3','4'),
  ('Jacob', 'Claire','0725068634','egestas.rhoncus@outlook.com', 'female', '2005-01-02','1', '7600','2','3','4'),
  ('Tallulah', 'Fora','0835576512','consequat.purus@icloud.com', 'female', '2000-03-05','2', '6000','2','3','2'),
  ('Carlos', 'Benson','0833186465', 'enim@outlook.com', 'male', '2000-03-14','3','0002','4','5','4');
  

INSERT INTO profession (profession)
VALUES ('Front End Web Developer'),
	   ('Traditional Healer'),
	   ('Clinical Psychologist'),
	   ('Marketing Manager'),
	   ('Sales Executive'),
	   ('HR Business Partner');

INSERT INTO zip_code (postal_code,city, province) 
VALUES ('1201','Nelspruit', 'Mpumalanga'),
	   ('1242','Hazyview', 'Mpumalanga'),
	   ('0850','Tzaneen', 'Limpopo'),
	   ('0699','Polokwane', 'Limpopo'),
	   ('2531','Potchefstroom', 'North West'),
	   ('2745','Mahikeng', 'North West'),
	   ('2000','Johannesburg', 'Gauteng'),
	   ('0002','Pretoria', 'Gauteng'),
	   ('9585','Parys', 'Free State'),
	   ('9301','Bloemfontein', 'Free State'),
	   ('8801','Upington', 'Northern Cape'),
	   ('8301','Kimberley', 'Northern Cape'),
	   ('6000','Port Elizabeth', 'Eastern Cape'),
	   ('5201','East London', 'Eastern Cape'),
	   ('7600','Stellenbosch', 'Western Cape'),
	   ('8000','Cape Town', 'Western Cape'),
	   ('4000','Durban', 'KwaZulu Natal'),
	   ('3201','Pietermaritzburg', 'KwaZulu Natal');
	   
INSERT INTO status (status)
VALUES ('Single'),
	   ('Divorced'),
	   ('Unmarried'),
	   ('It is Complicated'),
	   ('Separated');
	   
INSERT INTO contact_interest (interest_id)
VALUES ('1'),
	   ('2'),
	   ('3'),
	   ('4'),
	   ('5');	   
	   
INSERT INTO contact_seeking (seeking_id)
VALUES ('1'),
	   ('2'),
	   ('3'),
	   ('4'),
	   ('5');

INSERT INTO interest (interest_id, interest)
VALUES ('1','Current Affairs'),
       ('2','Hiking'),
	   ('3','Interior Decor'),
	   ('4','Wellness'),
	   ('5','Art Collection');

INSERT INTO seeking (seeking_id,seeking)
VALUES ('1','Male'),
	   ('2','Female'),
	   ('3','Lesbian'),
	   ('4', 'Gay'),
   	   ('5', 'Bisexual');
_________________________________________________________________________________

-- ODBC and JDBC Support

-- Question 5
-- 5. How to Use PostgreSQL Recursive Queries
-- Union operator used to combine results of two or more select statements
--Every SELECT statement must have the same number of columns


WITH RECURSIVE cohort AS (
SELECT first_name, last_name, status_id
FROM my_contacts
WHERE status_id = 2
UNION
SELECT e.first_name, e.last_name, e.status_id
FROM my_contacts e
INNER JOIN cohort s ON s.status_id = e.status_id)
SELECT * FROM cohort; 
 
--column headings (first_name, last_name, status_id - Elvis W, Rhiannon B, Paul H, Claire J, Fora T = 2
__________________________________________________________________________________________

-- ODBC and JDBC Support

--Question 6
-- 6. PostgreSQL FETCH Command to Limit Query Results
-- Seeks to extract data in the first row from the status table

SELECT status_id, status
FROM status
ORDER BY status_id
FETCH FIRST ROW ONLY;
 
--Values returned status_id(1) and status (single)
____________________________________________________________________________________

-- ODBC and JDBC Support

--Question 7
-- 7. Expert Inner Join Queries in PostgreSQL
-- Seeks to compare all contacts in the database who share a profession

SELECT my_contacts.prof_id, my_contacts.first_name, profession.profession
FROM my_contacts
INNER JOIN profession 
ON my_contacts.prof_id = profession.prof_id
WHERE profession.prof_id=3
ORDER BY my_contacts.first_name;
 
-- Values (columns) returned: prof_id, first_name and profession
-- Listed all individuals from the database who shared the same profession

_________________________________________________________________________________
 
 -- ODBC and JDBC Support
 
-- Question 8
-- Advanced PostgreSQL Self-Join Query and Alias (revisit)
--Self join seeks to create a copy of the same table. We make use of inner join/outer 
-- join than "self join".
-- Important to create aliases for your tables to prevent yielding invalid results when
-- running tables

-- Query determines all the people on the database that share the same profession, ranked
--by prof_id.

SELECT 
m1.first_name, 
m2.first_name, 
m1.prof_id
FROM
my_contacts m1
INNER JOIN my_contacts m2 
ON m1.contact_id <> m2.contact_id
AND m1.prof_id = m2.prof_id
ORDER BY prof_id;
________________________________________________________________________________

 -- ODBC and JDBC Support
 
--Question 9
-- 9. Full Outer Join Query (revisit)
-- Compares two tables together
-- This query seeks to see whether everyone on the database has a profession. If not, a null value will be returned

SELECT e.first_name, e.last_name, d.profession
FROM my_contacts e
FULL OUTER JOIN profession d ON d.prof_id = e.prof_id;

___________________________________________________________________________________

 -- ODBC and JDBC Support
 
-- Question 10
-- 10. Advanced Where Clause in Full Outer Join Query??

SELECT e.first_name, e.last_name, d.profession
FROM my_contacts e
FULL OUTER JOIN profession d ON d.prof_id = e.prof_id
WHERE e.first_name IS NULL;

-- No values returned as no NULL values
________________________________________________________________________________

 -- ODBC and JDBC Support
 
-- Question 11
-- 11. PostgreSQL Advanced Query Using the LEFT JOIN Clause

SELECT
my_contacts.last_name,
my_contacts.prof_id,
my_contacts.interest_id,
profession.profession
FROM
my_contacts
LEFT JOIN profession ON my_contacts.prof_id = profession.prof_id;
 
-- Output: Column fields (last-name, prof_id, interest_id, profession) with the respective
-- records
______________________________________________________________________________________

 -- ODBC and JDBC Support
 
--Question 12
-- 12. Implementing the CROSS JOIN Query in PostgreSQL

SELECT * FROM status CROSS JOIN interest;
 
 --Cross join creates a cross of two tables if no condition is specified.
 --Table will include all attributes of both tables including duplicates and common 
 -- columns
 --Output: status_id, status, interest_id, interest
 --Output: Grouped by status_id and column attributes and alongside depicts from
 -- those that are status_id (1) and status (single) and what their interests are.
 -- Result won't make sense unless you have a general requirement
 -- All possible combinations
___________________________________________________________________________________

 -- ODBC and JDBC Support
 
 -- Question 13
 -- 13. Elegant NATURAL JOIN Query in PostgreSQL
 -- Easiest way to identify identical column labels (matching labels)

 
 SELECT * FROM profession NATURAL JOIN interest;
 
 --Output: Contains all attributes of both tables. 
 -- Groups profession and corresponds it with resultant interest_id and interest
___________________________________________________________________________________ 
 
-- ODBC and JDBC Support
-- Question 14
-- 14. Applying the UNION Operator to Multiple PostgreSQL Advanced Queries
-- UNION operator used to combine two/more SELECT statment. 
-- Columns to be compared must have the same number of columns

SELECT first_name, last_name, prof_id FROM my_contacts;
 
SELECT first_name FROM my_contacts
UNION 
SELECT profession FROM profession
ORDER BY first_name;
____________________________________________________________________________________

 -- ODBC and JDBC Support
 
-- Question 15
-- 15. Use a PostgreSQL Query Result to Create a Table
-- Creating a new table in PostgreSQL
 
SELECT status_id, prof_id
INTO status_2
FROM my_contacts
WHERE status_id =2;
 
SELECT * FROM status_2;
__________________________________________________________________________________

 -- ODBC and JDBC Support

--Question 16
--16. Implementing Math Functions in PostgreSQL Queries
-- Command used to find the numeric average of status_ids.
 
 SELECT AVG(status_id) FROM status;

___________________________________________________________________________________
 
-- Question 17
-- 17. Using the Advanced Subquery in PostgreSQL


SELECT status_id, prof_id
FROM my_contacts
WHERE status_id > (
SELECT AVG (prof_id) FROM my_contacts
);
 
__________________________________________________________________________________

 -- ODBC and JDBC Support
 
-- Question 18
-- 18. Querying Stats on the Postgre DB
-- Query used to determine the largest table in the database
-- Key:
-- relname - table name
-- relpages - number of pages
-- pg_class - system table names

-- Output: pg_proc = 94; is a system catalogue which stores information about functions, procedures (from PostgreSQL)
 
SELECT relname, relpages 
FROM pg_class 
ORDER BY relpages DESC limit 1;
____________________________________________________________________________________

 -- ODBC and JDBC Support
 
--Question 19
-- 19. Using PostgreSQL SELECT DISTINCT clause 

-- Average of all prof_ids is 3.2 
SELECT AVG (prof_id) FROM my_contacts;
 
-- This command sets to find unique values in a category
 
SELECT DISTINCT prof_id, interest_id
FROM my_contacts
WHERE interest_id > (
SELECT AVG (prof_id) FROM my_contacts
);

___________________________________________________________________________________
 
-- Object-Oriented SQL for Data Complexity

-- 1. ROLLUP
-- An extension of the GROUP BY clause 
-- The ROLLUP option allows you to include extra rows that represent the subtotals, which are commonly referred to as super-aggregate rows, 
-- along with the grand total row.
 
SELECT contact_id, count(contact_id)
FROM my_contacts
GROUP BY ROLLUP(contact_id);
 
-- Output: Seeks to find the total number of contacts on the database and their contact_id
-----------------------------------------------------------------------------------
 
-- 2. CUBE
-- Enables the user to obtain sequences

SELECT prof_id,profession, Count(*)
FROM profession
GROUP BY CUBE(prof_id, profession);

------------------------------------------------------------------------------------ 
-- 3. Index
-- Enables the user to search for data and is returned quickly
 
CREATE INDEX profession_idx ON profession (prof_id);
------------------------------------------------------------------------------------ 
--4. HAVING Clause
-- The HAVING clause is often used with the GROUP BY clause in the SELECT statement
-- To find all the contacts on the database with a contact_id that is above 61,
-- you will include "Having" to this clause:
 
SELECT DISTINCT contact_id, first_name, last_name
FROM my_contacts
WHERE contact_id IS NOT NULL
GROUP BY contact_id
HAVING contact_id>=61
ORDER BY contact_id;
______________________________________________________________________________________
 
-- 5. Triggers
-- We will make use of the my_contacts table in the database
-- In order to log changes in the prof_id column, we will need to create a separate table
-- for storing the changes and use a trigger to insert the changes into this table.
 
CREATE TABLE prof_changes (
    contact_id bigserial,
    changed_at DATE DEFAULT CURRENT_TIMESTAMP,
    old_prof_id integer,
    new_prof_id integer,
    PRIMARY KEY (contact_id , changed_at)
); 
 
SELECT * FROM prof_changes;
 
CREATE TRIGGER before_update_profession
BEFORE UPDATE ON my_contacts
FOR EACH ROW
BEGIN
   IF NEW.prof_id <> OLD.prof_id THEN
	INSERT INTO my_contacts(contact_id,old_prof_id,new_prof_id)
        VALUES(NEW.contact_id,OLD.prof_id,NEW.prof_id);
    END IF;
END;

__________________________________________________________________________________
 
--6. Missing Values in a Sequence
-- https://www.xaprb.com/blog/2005/12/06/find-missing-numbers-in-a-sequence-with-sql/
-- Seeks to identify if there are numbers from the sequence of the database

SELECT  contact_id + 1 -- indicates where the counting should begin
FROM my_contacts a
WHERE   NOT EXISTS
(
SELECT  NULL
FROM my_contacts b
WHERE   a.contact_id = b.contact_id + 1 -- where the counting should end
)
ORDER BY contact_id;

 
___________________________________________________________________________________
 
 -- 7. RANK() function
 -- The RANK() function assigns a rank to each row within the result set sorted by first_name from high to low.

SELECT first_name, prof_id, seeking_id,
RANK () OVER (
PARTITION BY first_name
ORDER BY
first_name)
FROM my_contacts;

 
--Output: first_name, prof_id, seeking_id and rank
 _________________________________________________________________________________
 
 -- 8. DENSE_RANK()
 
SELECT first_name, last_name, prof_id, status_id,
DENSE_RANK () OVER (
PARTITION BY prof_id
ORDER BY status_id)
FROM my_contacts;
 
 _________________________________________________________________________________
 
 -- 9. FIRST_VALUE()

SELECT contact_id, first_name, last_name,
FIRST_VALUE(contact_id) OVER (
PARTITION BY first_name
ORDER BY
last_name
)
FROM my_contacts;
______________________________________________________________________________
 
 -- 10. LAST_VALUE()

SELECT contact_id, first_name, last_name,
LAST_VALUE(contact_id) OVER (
ORDER BY first_name
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)interest_id
FROM my_contacts;
 _____________________________________________________________________________
 
 -- 11 Explain Statement
 
EXPLAIN SELECT * FROM profession; 
 
 --Output: Query Plan: Seq scan on profession (cost=0.00..1.06 rows=6 width=126)
 
 ______________________________________________________________________________
 
-- 12. Create Role 
-- Create profile and log on credentials of user
 
CREATE ROLE Neo
LOGIN
PASSWORD 'myPass1';

 ______________________________________________________________________________
 
-- 13. Group roles
-- Grants employees access permissions

 CREATE ROLE emp;
 GRANT emp TO Neo;
 
 