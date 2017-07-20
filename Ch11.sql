#Kanchi Chandwani
# Chapter 11 How to Create Databases, Tables, and Indexes


# Problem 1
use my_guitar_shop;
#CREATE INDEX address_zip_code_ix ON addresses(zip_code);

#Problem 2
DROP DATABASE IF EXISTS my_web_db;
CREATE DATABASE my_web_db;

USE my_web_db;
CREATE TABLE users
(
    user_id              INT                PRIMARY KEY            AUTO_INCREMENT,
    email_address        VARCHAR(100)   	NOT NULL,
    first_name           VARCHAR(45)        NOT NULL,
    last_name            VARCHAR(45)        NOT NULL
    #CONSTRAINT pk_user_id PRIMARY KEY (user_id)
);

ALTER TABLE users ENGINE InnoDB;
ALTER TABLE users
	CHARSET utf8 COLLATE utf8_general_ci;
    
CREATE TABLE products
(
    products_id            INT                PRIMARY KEY            AUTO_INCREMENT,
    product_name        VARCHAR(45)        NOT NULL
    #CONSTRAINT pk_products_id PRIMARY KEY (products_id)
);

ALTER TABLE products ENGINE InnoDB;
ALTER TABLE products
	CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE downloads
(
    download_id            INT                PRIMARY KEY            AUTO_INCREMENT,
    download_date        DATETIME       	  NOT NULL,
    filename            VARCHAR(50)        	  NOT NULL,
    products_id            INT                NOT NULL,
    user_id                INT                NOT NULL,
    CONSTRAINT fk_products_downloads FOREIGN KEY (products_id)
        REFERENCES products (products_id),
    CONSTRAINT fk_users_downloads FOREIGN KEY (user_id)
        REFERENCES users (user_id)
);

ALTER TABLE downloads ENGINE InnoDB;
ALTER TABLE downloads
	CHARSET utf8 COLLATE utf8_general_ci;

#Problem 3
INSERT INTO users 
VALUES (101, "JohnSmith@gmail.com", "John", "Smith");
INSERT INTO users 
VALUES (102, "JaneDoe@yahoo.com", "Jane", "Doe");

INSERT INTO products
 VALUES (201, "Local Music Vol 1");
INSERT INTO products
 VALUES (202, "Local Music Vol 2");
 
INSERT INTO downloads 
 VALUES (301, NOW(), 'pedals_are_falling.mp3', 202, 101);
INSERT INTO downloads 
 VALUES (302, NOW(), 'turn_signal.mp3', 201, 102);
 
INSERT INTO downloads 
 VALUES (303, NOW(), 'one_horse_town.mp3', 202, 102);

SELECT email_address, first_name, last_name, download_date, filename, product_name
FROM products
	JOIN downloads 
    ON products.products_id = downloads.products_id
    JOIN users
    ON downloads.user_id = users.user_id
ORDER BY email_address DESC;

#Problem 4
ALTER TABLE products
    ADD COLUMN product_price float(3,2)		 DEFAULT 9.99;
ALTER TABLE products
    ADD COLUMN product_added_date	 DATE;

#Problem 5
ALTER TABLE users
   MODIFY first_name varchar(20) NOT NULL UNIQUE;
INSERT INTO users (first_name)
    VALUES ('Afirstnamethatislongerthan20char');
