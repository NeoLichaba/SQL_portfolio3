-- Database: dating_database

CREATE TABLE my_contacts (
	contact_id bigserial CONSTRAINT contacts_key PRIMARY KEY,
	last_name varchar(50) NOT NULL,
	first_name varchar(50) NOT NULL,
	phone varchar (12) NOT NULL,
	email varchar (100) NOT NULL,
	gender varchar (50) NOT NULL,
	birthday date NOT NULL,
	prof_id integer REFERENCES profession (prof_id), 
	zip_code varchar (50) REFERENCES zip_code (postal_code),
	status_id integer REFERENCES status (status_id)
);	

--INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday)
--VALUES (Jordaa, Sean, 0823438796, seanj@gmail.com, male, 20/03/1990),
--		 (Mosoathupa, Lethabo, 0831234563, lethabom@gmail.com, male, 14/02/1994),
--   	 (Lichaba, Neo, 0675437896, neolich@gmail.com, female, 29/04/1985),
-- 		 (Hlanga, Vusi, 0875431289, vusih@gmail.com, male, 31/12/1989),
--		 (Knox, Byron, 0862345698)

DROP TABLE profession;

CREATE TABLE profession (
	prof_id bigserial CONSTRAINT prof_id_key PRIMARY KEY,
	profession varchar (50), 
	CONSTRAINT profession_unique UNIQUE (profession)
);

--INSERT INTO profession...

CREATE TABLE zip_code (
	postal_code varchar(4) CONSTRAINT postal_code_key PRIMARY KEY,	
	city varchar (50),
	province varchar (50),
	CONSTRAINT postal_code CHECK (length(postal_code)=4)
);

drop table zip_code;

--INSERT INTO zip_code...

CREATE TABLE status (
	status_id bigserial CONSTRAINT status_id_key PRIMARY KEY,
	status varchar(25)
);
	
--INSERT INTO status...

CREATE TABLE contact_interest (
	contact_id INT REFERENCES my_contacts (contact_id),
	interest_id INT REFERENCES interest (interest_id)
);

--INSERT contact_interest...

CREATE TABLE contact_seeking (
	contact_id INT REFERENCES my_contacts (contact_id),
	seeking_id INT REFERENCES seeking (seeking_id)
);

--INSERT INTO contact_seeking...

CREATE TABLE interest (
	interest_id INT CONSTRAINT contact_interest_key PRIMARY KEY,
	interest varchar (50)
);

CREATE TABLE seeking (
	seeking_id INT CONSTRAINT seeking_key PRIMARY KEY,
	seeking varchar (50)
);
--INSERT INTO interest...
