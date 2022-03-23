-- Database: shopping_cart

-- DROP DATABASE IF EXISTS shopping_cart;

CREATE DATABASE shopping_cart
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
----------------------------------------------------------------------------------------------
--Question 1 --
-- Create a price list table containing a list of items sold in the shop and their prices

--DROP TABLE product;

CREATE TABLE product (
	prod_id varchar (50) CONSTRAINT pro_id_key PRIMARY KEY,
	pro_name varchar (50) NOT NULL,
	pro_price money
);

INSERT INTO product (prod_id, pro_name, pro_price)
VALUES ('P100', 'Unleaded Petrol', '40'),
	   ('P101', 'Iced Coffee', '50'),
	   ('P102', 'Newspaper', '40'),
	   ('P103', 'Still water', '20'),
	   ('P104', 'Sugar Free Soda', '25'); 

---------------------------------------------------------------------------------------------
-- Question 2
-- Create the user table with a list of users and their respective details

--DROP TABLE customer_info;

CREATE TABLE cust_(
	cust_id varchar (10)CONSTRAINT cust_id_key PRIMARY KEY,
	first_name varchar (50) NOT NULL,
	last_name varchar (50) NOT NULL,
	cust_phone varchar (20) NOT NULL,
	email varchar (50),
	CONSTRAINT email_unique UNIQUE (email)
);

INSERT INTO cust_ (cust_id, first_name, last_name, cust_phone, email) 
VALUES ('101','Bell', 'Harmon', '0829713945','bibendum@google.com'),
  ('102','Garth', 'Rush', '0836420988','suspendisse@protonmail.com'),
  ('103','Britanni', 'Hays','0677556576','venenatis.a@google.com'),
  ('104','Beatrice', 'Ferrell', '0760327662','enim.etiam@hotmail.co.uk'),
  ('105','Colorado', 'Beck','0677155312','maecenas.iaculis.aliquet@icloud.org'); 

---------------------------------------------------------------------------------------------
-- Question 3
-- Cart table created with ids related to cust and product

--DROP TABLE cart;

CREATE TABLE cart (
	cust_id varchar (10) REFERENCES cust_(cust_id),
	prod_id varchar (10) REFERENCES product (prod_id)	
);
INSERT INTO cart (cust_id,prod_id)
VALUES ('101', 'P100'),
	   ('102', 'P101'),
	   ('103', 'P102'),
	   ('104', 'P103'),
	   ('105', 'P104');
---------------------------------------------------------------------------------------------

--DROP TABLE cust_order;
--CREATE TABLE cust_order (
--	order_id varchar (10) CONSTRAINT order_id_key PRIMARY KEY,
--	first_name varchar (50),
--	last_name varchar (50),
--	pro_name varchar (50),
--	pro_price money
--);

-- Insert data into cust_order

--INSERT INTO cust_order (order_id,first_name,last_name,pro_name,pro_price)
--VALUES ('20','Bell', 'Harmon', 'Unleaded Petrol', '40'),
--	   ('40','Garth', 'Rush','Iced Coffee', '50'),
--	   ('60', 'Britanni', 'Hays','Newspaper', '40'),
--	   ('80', 'Beatrice', 'Ferrell', 'Still Water', '20'),
--	   ('100', 'Colorado', 'Beck','Sugar Free Soda', '25');
	   
---------------------------------------------------------------------------------------------
	   
-- Run data in tables

SELECT * FROM cust_;
SELECT * FROM product;
SELECT * FROM cart;
--SELECT * FROM cust_order;	   

---------------------------------------------------------------------------------------------
-- Funtional Requirements:

-- Question 4
-- Menu - Write the query that will be used to display the menu to the user

SELECT * FROM product;
---------------------------------------------------------------------------------------------

-- Question 5
-- Add To Cart - write the query that will add a selected item to a users shopping cart (4 times)

CREATE TABLE shoppingCart (
	cust_id varchar (10) REFERENCES cust_(cust_id),
	email varchar (50) REFERENCES cust_(email),
	prod_id varchar (10) REFERENCES product (prod_id),
	pro_name varchar (50) REFERENCES product(pro_name),
	pro_price money REFERENCES product(pro_price)
	);

INSERT INTO shoppingCart(cust_id,email,prod_id,pro_name,pro_price)
SELECT cart.cust_id, cust_.email, product.prod_id, product.pro_name, product.pro_price
FROM cart
LEFT JOIN cust_
ON cart.cust_id=cust_.cust_id
LEFT JOIN product
ON cart.prod_id=product.prod_id;

SELECT * FROM shoppingCart;

---------------------------------------------------------------------------------------------
-- Question 6
-- Tables are joined with details in order to reflect the current customers' cart

SELECT cust_.cust_id, cust_.first_name, cust_.last_name, cart.prod_id, product.pro_name, product.pro_price
FROM cust_
LEFT JOIN cart
ON cart.cust_id=cust_.cust_id
LEFT JOIN product
ON cart.prod_id=product.prod_id
WHERE cust_.cust_id= '101';

SELECT cust_.cust_id, cust_.first_name, cust_.last_name, cart.prod_id, product.pro_name, product.pro_price
FROM cust_
LEFT JOIN cart
ON cart.cust_id=cust_.cust_id
LEFT JOIN product
ON cart.prod_id=product.prod_id
WHERE cust_.cust_id= '102';

SELECT cust_.cust_id, cust_.first_name, cust_.last_name, cart.prod_id, product.pro_name, product.pro_price
FROM cust_
LEFT JOIN cart
ON cart.cust_id=cust_.cust_id
LEFT JOIN product
ON cart.prod_id=product.prod_id
WHERE cust_.cust_id= '103';

SELECT cust_.cust_id, cust_.first_name, cust_.last_name, cart.prod_id, product.pro_name, product.pro_price
FROM cust_
LEFT JOIN cart
ON cart.cust_id=cust_.cust_id
LEFT JOIN product
ON cart.prod_id=product.prod_id
WHERE cust_.cust_id= '104';
--------------------------------------------------------------------------------------------

-- Checkout - Calculate the total of the shopping cart and create an Order

SELECT cust_id, SUM(product.pro_price)
FROM shoppingCart
LEFT JOIN product on product.prod_id = shoppingCart.prod_id
GROUP BY cust_id
ORDER BY cust_id;

SELECT cust_id, COUNT(pro_name), SUM(pro_price) 
FROM shoppingCart
GROUP BY cust_id;
  