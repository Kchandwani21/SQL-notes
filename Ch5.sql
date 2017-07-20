#Kanchi Chandwani
#Chapter 5 : How to Insert, update, delete data
# CS 269 

#Problem 1
INSERT INTO categories (category_name)
VALUES ('Brass');

#Problem 2
UPDATE categories
SET category_name = 'woodwinds'
WHERE category_id = 5;


#Problem 3
DELETE FROM categories
WHERE category_id = 5;

# Problem 4
INSERT INTO products
(product_id, category_id, product_code, product_name,description, list_price, discount_percent, date_added)
VALUES 
( DEFAULT, 4, 'dgx_640','Yamaha DGX 640 88-Key Digital Piano','Long description to come.', 799.99, 0, current_timestamp());

#Problem 5
UPDATE products 
SET discount_percent = 35
WHERE product_name =  'Yamaha DGX 640 88-Key Digital Piano';
