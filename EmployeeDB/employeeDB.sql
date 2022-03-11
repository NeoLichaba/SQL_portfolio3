-- CREATE DATABASE EMPLOYEEDB

CREATE TABLE employees (
	emp_id bigserial CONSTRAINT emp_key PRIMARY KEY,
	first_name varchar(50),
	surname varchar(50),
	gender varchar(1),
	address varchar (200),
	email varchar (200), 
	depart_id INT REFERENCES department (depart_id),
	role_id INT REFERENCES roles (role_id),
	salary_id INT REFERENCES salaries (salary_id),
	overtime_id INT REFERENCES overtime_hours (overtime_id),
	CONSTRAINT email_unique UNIQUE (email)
);

INSERT INTO employees (first_name, surname, gender, address, email, depart_id,role_id,salary_id,overtime_id)
VALUES ('Neo', 'Lichaba', 'F', '959 Inchanga Road', 'neolich@bootcamp.com',1,1,1,1),
	   ('Tlhokomelo', 'Hlomuka','F', '230 Uranium Street', 'tlhokih@bootcamp.com',2,2,2,2),
	   ('Byron', 'Knox', 'M', '546 Tom Jones','byronk@ybootcamp.com',3,3,3,3),
	   ('Hassan', 'Mansoor','M', 'Plot 345 William Nicol', 'hassanm@bootcamp.com',4,4,4,4),
	   ('Vusi', 'Hlanga', 'M', '345 Rivonia Road', 'vusih@bootcamp.com',5,5,5,5);

SELECT * FROM employees;

CREATE TABLE department (
	depart_id bigserial CONSTRAINT depart_key PRIMARY KEY,
	depart_name varchar (50),
	depart_city varchar (50)
);

INSERT INTO department (depart_name,depart_city)
VALUES ('Marketing','Johannesburg'),
	   ('Sales', 'Johannesburg'),
	   ('HR','Johannesurg'),
	   ('Executive Team','Cape Town'),
	   ('Executive Team', 'Cape Town');

SELECT * FROM department;

CREATE TABLE roles (
	role_id bigserial CONSTRAINT role_key PRIMARY KEY,
	role varchar (50)
);

INSERT INTO roles (role)
VALUES ('Marketing Manager'),
	   ('HR Assistant'),
	   ('Sales Executive'),
	   ('Sales Director'),
	   ('General Manager');

SELECT * FROM roles;

CREATE TABLE salaries (
	salary_id bigserial CONSTRAINT salary_key PRIMARY KEY,
	salary_pa INT -- make use of money, ALTER TABLE LATER
);

INSERT INTO salaries (salary_pa)
VALUES ('980000' ),
	   ('500000'),
	   ('750000'),
	   ('1200000'),
	   ('3000000');
	   
SELECT * FROM salaries;

CREATE TABLE overtime_hours (
	overtime_id bigserial CONSTRAINT overtime_key PRIMARY KEY,
	overtime_hours INT
);
-- Table dropped
INSERT INTO overtime_hours (overtime_hours) -- Table dropped
VALUES ('2'),
	   ('4'),
	   ('6'),
	   ('8'),
	   ('10');

SELECT * FROM overtime_hours;

DROP TABLE overtime_hours; 

CREATE TABLE overtime_hours (
	overtime_id bigserial CONSTRAINT overtime_key PRIMARY KEY,
	overtime_hours numeric
);

INSERT INTO overtime_hours (overtime_hours)
VALUES ('2.5'),
	   ('4'),
	   ('6.5'),
	   ('8'),
	   ('10');
	   
SELECT * FROM overtime_hours;

SELECT employees.first_name, employees.surname, employees.gender, employees.address,employees.email,
department.depart_name, department.depart_city, roles.role, salaries.salary_pa, overtime_hours.overtime_hours
FROM employees LEFT JOIN department
ON employees.depart_id=department.depart_id
LEFT JOIN roles ON 
employees.role_id = roles.role_id
LEFT JOIN salaries ON
employees.salary_id = salaries.salary_id
LEFT JOIN overtime_hours
ON employees.overtime_id = overtime_hours.overtime_id;
