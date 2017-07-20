# Kanchi Chandwani
#CS 269
#Chapter 4:How to Retrieve data from two or More Tables

#Problem 1
SELECT category_name, product_name, list_price
FROM categories 
INNER JOIN products
	ON categories.category_id = products.category_id
ORDER BY category_name, product_name ASC;

#Problem 2
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers 
JOIN addresses
ON customers.customer_id = addresses.customer_id
WHERE customers.email_address = 'allan.sherwood@yahoo.com';

#Problem 3
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers 
JOIN addresses
	ON customers.customer_id = addresses.customer_id 
    AND customers.shipping_address_id = addresses.address_id;

#Problem 4
SELECT last_name, first_name, order_date, product_name,
	item_price, discount_amount, quantity
FROM customers c
	JOIN orders o
		ON c.customer_id = o.customer_id
	JOIN order_items oi
		ON o.order_id = oi.order_id
	JOIN products p
		ON oi.product_id = p.product_id
ORDER BY last_name, order_date, product_name;

#Problem 5
SELECT p1.product_name, p1.list_price
FROM products AS p1
JOIN products AS p2
	ON p1.product_id <> p2.product_id
	AND p1.list_price = p2.list_price
ORDER BY product_name;

#Problem 6
SELECT category_name, product_id
FROM categories c
	LEFT JOIN products p
	ON c.category_id = p.category_id
WHERE product_id IS NULL;

#Problem 7
#first select statement
SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM orders
	WHERE ship_date IS NOT NULL
UNION
# second select statement 
SELECT 'NOT SHIPPED', order_id, order_date
FROM orders
WHERE ship_date IS NULL
ORDER BY order_date;	

