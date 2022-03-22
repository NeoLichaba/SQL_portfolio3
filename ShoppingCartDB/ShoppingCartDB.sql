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

-- 1. Create tables that will hold all the data

CREATE TABLE customer_info (
	cust_id varchar (10)CONSTRAINT cust_id_key PRIMARY KEY,
	first_name varchar (50) NOT NULL,
	last_name varchar (50) NOT NULL,
	cust_phone varchar (20) NOT NULL,
	email varchar (50),
	CONSTRAINT email_unique UNIQUE (email)
);
DROP TABLE product;
CREATE TABLE product (
	prod_id varchar (50) CONSTRAINT pro_id_key PRIMARY KEY,
	pro_name varchar (50) NOT NULL,
	pro_price money
);
DROP TABLE cust_order;
CREATE TABLE cust_order (
	order_id varchar (10) CONSTRAINT order_id_key PRIMARY KEY,
	cust_id varchar (10) REFERENCES customer_info(cust_id),
	prod_id varchar (10) REFERENCES product (prod_id),
	quantity integer NOT NULL
);

DROP TABLE cart;
CREATE TABLE cart (
	cust_id varchar (10), 
	prod_id varchar (10), 
	pro_name varchar (50),
	price money
);


-- 2. Insert data into the respective tables

-- Insert data into customer_info

INSERT INTO customer_info (cust_id, first_name, last_name, cust_phone, email) 
VALUES ('101','Bell', 'Harmon', '0829713945','bibendum@google.com'),
  ('102','Garth', 'Rush', '0836420988','suspendisse@protonmail.com'),
  ('103','Britanni', 'Hays','0677556576','venenatis.a@google.com'),
  ('104','Beatrice', 'Ferrell', '0760327662','enim.etiam@hotmail.co.uk'),
  ('105','Colorado', 'Beck','0677155312','maecenas.iaculis.aliquet@icloud.org'); 


-- Insert data into product

INSERT INTO product (prod_id, pro_name, pro_price)
VALUES ('P100', 'Unleaded Petrol', '40'),
	   ('P101', 'Iced Coffee', '50'),
	   ('P102', 'Newspaper', '40'),
	   ('P103', 'Still water', '20'),
	   ('P104', 'Sugar Free Soda', '25'); 


-- Insert data into cust_order

INSERT INTO cust_order (order_id,cust_id,prod_id,quantity)
VALUES ('20', '101', 'P100','10'),
	   ('40', '102', 'P101','10'),
	   ('60', '103', 'P102','10'),
	   ('80', '104', 'P103','10'),
	   ('100', '105', 'P104','10');
	   
-- Run data in tables

SELECT * FROM customer_info;
SELECT * FROM product;
SELECT * FROM cust_order;
SELECT * FROM cart;
	   
-- Funtional Requirements:

-- 1. Menu - Write the query that will be used to display the menu to the user

SELECT * FROM product;

-- 2. Add To Cart - write the query that will add a selected item to a users shopping cart

-- 4 times 
INSERT INTO cart (cust_id,prod_id,pro_name,price)
SELECT customer_info.cust_id, product.prod_id, product.pro_name, product.price
FROM customer_info
LEFT JOIN cart ON customer_info.cust_id = cart.cust_id
LEFT JOIN product ON cust_order.prod_id=product.prod_id
WHERE cart.user_id=101;

SELECT customer_info.cust_id, product.prod_id, product.pro_name, product.price
FROM customer_info
LEFT JOIN cart ON customer_info.cust_id = cart.cust_id
LEFT JOIN product ON cust_order.prod_id=product.prod_id
WHERE cart.user_id=101;

-- 3. View Cart - Display the current user's shopping cart

SELECT cust_id, SUM(quantity*product.pro_price)
FROM cust_order
LEFT JOIN product on product.prod_id = cust_order.prod_id
GROUP BY cust_id
ORDER BY cust_id;

-- 4. Checkout - Calculate the total of the shopping cart and create an Order

SELECT cust_id, count (items_list), sum(price) from shopping_cart
GROUP BY cust_id;
  