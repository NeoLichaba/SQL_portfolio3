CREATE TABLE zoo (
 id bigserial,
 mammals varchar(50),
 fish varchar(50),
 birds varchar(50),
 reptiles varchar(50),
 amphibians varchar (50)
 
 ) ;

INSERT into zoo (mammals, fish, birds, reptiles, amphibians)
VALUES 		
		('Elephant', 'Butterflyfish', 'Hoopoe','Crocodile', 'Frogs'),
       	('Rhino', 'Clownfish', 'Kingfisher', 'Black Mamba', 'Toads'),
		('Gorilla', 'Blue Tang', 'Bee Eater', 'Tortoise', 'Salamanders'),
		('Leopard', 'Bream', 'Parrot', 'Chameleon', 'Newts');
		
CREATE TABLE info (
 id bigserial,
 mammals varchar(50),
 fish varchar(50),
 birds varchar(50),
 reptiles varchar(50),
 amphibians varchar (50)
 ) ;

INSERT into info (mammals, fish, birds, reptiles, amphibians)
VALUES 		('Largest land animal', 'Reef fish', 'Makes Hoo-poo sound','Crocodile', 'Breathe through skin'),
       		('Black and white rhinos', 'Finding Nemo', 'Itsy bitsy bird', 'Black Mamba', 'Wart like skin'),
			('Silverback', 'Dory', 'Eats honeybees', 'Colour indicates origin', 'Produces mucous that covers skin'),
			('Nocturnal', 'Silver', 'Imitates sound', 'Camouflages', 'Regenerate parts of body');


