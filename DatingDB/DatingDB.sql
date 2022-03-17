-- Database: dating_database

-- Database: dating_database

DROP TABLE my_contacts;

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

DROP TABLE profession;

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

--DROP TABLE postal_code;

CREATE TABLE zip_code (
	postal_code varchar(4) CONSTRAINT postal_code_key PRIMARY KEY,	
	city varchar (50),
	province varchar (50),
	CONSTRAINT postal_code CHECK (length(postal_code)=4)
);

--drop table zip_code;

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
	   ('It is Complicated');

SELECT * FROM status;

DROP TABLE contact_interest;
   
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

DROP TABLE contact_seeking;
   
CREATE TABLE contact_seeking (
	contact_id bigserial REFERENCES my_contacts (contact_id),
	seeking_id INT REFERENCES seeking (seeking_id)
);

INSERT INTO contact_seeking (seeking_id)
VALUES ('1'),
	   ('2'),
	   ('3'),
	   ('4'),
	   ('5');


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

DROP TABLE seeking;

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







