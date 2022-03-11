CREATE TABLE albums (
 album_id bigserial CONSTRAINT album_id_key PRIMARY KEY, -- natural primary identifier in table, unique to all 
 album_catalog_code varchar(100) NOT NULL,
 album_title text NOT NULL,
 album_artist text NOT NULL,
 album_release_date date,
 album_genre varchar(40),
 album_description text
);
CREATE TABLE songs (
 song_id bigserial,
 song_title text NOT NULL, 
 song_artist text NOT NULL,
 album_id bigint REFERENCES albums (album_id), --foreign key defined as references album_id in album table
 CONSTRAINT songs_key PRIMARY KEY (song_id) -- song_id might be connected to va
);

-- 1a) In both tables, the title and artists columns can not be empty as specified
-- via a NOT NULL constraint.

Select * FROM albums;

-- 2. Instead of using album_id as a surrogate key for your primary key, are
-- there any columns in albums that could be useful as a natural key? What would
-- you have to know to decide?

-- We could consider the album_catalog_code. We would have to answer yes to
-- these questions:
-- - Is it going to be unique across all albums released by all companies?
-- - Will we always have one?


-- 3.
-- Primary key columns get indexes by default, but we should add an index
-- to the album_id foreign key column in the songs table because we'll use
-- it when joining tables. It's likely that we'll query these tables to search
-- by titles and artists, so those columns in both tables should get indexes
-- too. The album_release_date in albums also is a candidate if we expect
-- to perform many queries that include date ranges.