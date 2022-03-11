--Chapter 2

CREATE TABLE try_it_yourself_school (
 id bigserial,
 first_name varchar(25),
 last_name varchar(50),
 school varchar(50),
 hire_date date,
 salary numeric
);

INSERT INTO  try_it_yourself_school (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
 ('Lee', 'Reynolds', 'Park Town Girls HS', '1993-05-22', 65000),
 ('Samuel', 'Cole', 'Park Town Boys HS', '2005-08-01', 43500),
 ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
 ('Betty', 'Diaz', 'Lowveld HS', '2005-08-30', 43500),
 ('Kathleen', 'Roush', 'Immaculate HS', '2010-10-22', 38500);
 
--Question 1

SELECT * 
FROM try_it_yourself_school
ORDER BY school ASC, last_name ASC; 

--Question 2

SELECT first_name
FROM try_it_yourself_school
WHERE first_name LIKE '%S%'
AND salary > 40000;

-- Question 3

SELECT first_name, last_name, hire_date, salary
FROM try_it_yourself_school
WHERE hire_date > '2010-01-01'
ORDER BY salary DESC;

-- Chapter 3
-- Question 1

-- Fixed-Point Numbers
-- The fixed-point type, also called the arbitrary precision type, is numeric(precision,scale). 
-- You give the argument precision as the maximum number of digits to the left and right of the decimal
-- point, and the argument scale as the number of digits allowable on theright of the decimal point. Alternately, you can specify this type using
-- decimal(precision,scale).

-- Question 2

-- varchar(n)
-- A variable-length column where the maximum length is specified by n.

-- Question 3
-- It returns an error of invalid input syntax for integer because letters can’t become integers!

-- Chapter 4
-- Question 1
COPY movie_ranking (id, movie, actor)
FROM 'C:\YourDirectory\movie-ranking.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ':');

-- Question 2
-- 
COPY (
	SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent,
	FROM us_counties_2010
	ORDER BY housing_unit_count_100_percent DESC
	LIMIT 20
	)
	TO 'C:\YourDirectory\housing-unit.csv'

-- Question 3
-- No, it would not work as the argument precision as the
-- maximum number of digits to the left and right of the decimal
-- point, and the argument scale as the number of digits allowable on the
-- right of the decimal point. In this instance, datatype
-- numeric (3,8) has limited the number of integers allowed
-- before the decimal point.

-- Chapter 5

-- Question 1

-- r=5
-- pi=3.14
-- A=(pi)(r^)

SELECT 3.14*(5^2);
-- ANS = 78.50

-- Question 2

SELECT geo_name,
state_us_abbreviation AS "st",
(CAST (p0010005 AS numeric(8,1)) / p0010001) * 100 AS "pct_Am Indian"
FROM us_counties_2010
ORDER BY "pct_Am Indian" DESC;

-- Shannon County: 

--Question 3

SELECT sum(p0010001) AS "County Sum",
round(AVG(p0010001), 0) AS "County Average",
median(p0010001) AS "County Median",
percentile_cont(.5)
WITHIN GROUP (ORDER BY p0010001) AS "50th Percentile"
FROM us_counties_2010;

--Chapter 6

-- Question 1

SELECT c2010.geo_name,c2000.geo_name
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.geo_name=c2000.geo_name
WHERE c2010.geo_name IS NULL;
