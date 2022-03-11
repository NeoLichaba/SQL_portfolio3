CREATE TABLE bands (
	id bigserial,
	name varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE albums (
	id bigserial,
	name varchar(255) NOT NULL,
	release_year INT,
	band_id INT NOT NULL, 
	-- band_id can not return no value hence not null
	-- band_id referencing id in bands
	PRIMARY KEY (id),
	FOREIGN KEY (band_id) REFERENCES bands(id)
	-- any form of key references tables other than its own
	-- note which column is referencing which table (band) and which column (id)
	
);

INSERT INTO bands (name) -- table/column
VALUES ('Urban Village');

INSERT INTO bands (name)
VALUES ('Cold Play'), ('Msaki'), ('Salt and Pepper');

SELECT * FROM bands;

SELECT * FROM bands
LIMIT 2; -- limit the amount of bands required

SELECT name FROM bands; -- only want specific column/s

SELECT id AS ID, name AS Band_Name
FROM bands;

SELECT * FROM bands 
ORDER BY name DESC;-- sort in asc/desc

INSERT INTO albums (name, release_year, band_id)
VALUES ('Magic', 2010, 1),
		('Love Is All We Need', 2012, 1),
		('Magic', 2010, 2),
		('Test Album', NULL, 3),
		('Adiwele', 2012, 3);
		
SELECT * FROM albums;

SELECT name FROM albums;
-- SELECT DISTINCT ... removes duplicates

UPDATE albums
SET release_year = 2000
WHERE id = 1; -- used when wanting to filter from database

SELECT * FROM albums
WHERE release_year <2000;

SELECT * FROM albums
WHERE name LIKE '%ag%' OR band_id=2; --wildcard

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2012;

SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums -- Delete a row from table
WHERE id = 4;

SELECT * FROM bands
JOIN  albums ON band_id = albums.band_id; 
--LEFT JOIN: Lists all values from LHS 
-- RIGHT JOIN: Lists all values from RHS

SELECT * FROM bands
LEFT JOIN  albums ON band_id = albums.band_id;

SELECT AVG(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;
-- Find out how many albums each of these bands have
-- Takes all records and groups by single column

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
-- refer to columns we want to select and aliased them
FROM bands AS b
LEFT JOIN albums AS a on b.id=a.band_id
GROUP BY b.id; --unique rows for different IDs 
-- Return different aggregates





