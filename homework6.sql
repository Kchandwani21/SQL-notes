#Kanchi Chandwani
# CS 269: Chapter 6: How to Code Summary Queries
# 10/17/2016

#Problem 1
SELECT COUNT(*) AS order_count, 
SUM( tax_amount ) AS TotalTaxAmount
 FROM Orders ;
 
 #Problem 2
 SELECT category_name, COUNT(products.category_id) AS product_count,
 MAX(list_price) AS most_expensiveproduct
 FROM  categories 
	JOIN products
	ON products.category_id = categories.category_id
 GROUP BY category_name
 ORDER BY COUNT(*) DESC;
 
 #Problem 3
 SELECT email_address, SUM(order_items.item_price * order_items.quantity) AS item_price_total,
 SUM(order_items.discount_amount * order_items.quantity) AS discount_amount_total
 FROM customers 
	JOIN orders
	ON customers.customer_id = orders.customer_id
	JOIN order_items
	ON orders.order_id = order_items.order_id
 GROUP BY email_address
 ORDER BY item_price_total DESC;
 
 #Problem 4
SELECT email_address, COUNT(orders.order_id) AS order_count,
((SUM(order_items.item_price) - SUM(order_items.discount_amount)) * SUM(order_items.quantity)) AS total_amount
FROM customers 
	JOIN orders
	ON customers.customer_id = orders.customer_id
    JOIN  order_items
	ON orders.order_id = order_items.order_id
GROUP BY email_address
HAVING COUNT(orders.order_id) > 1
ORDER BY SUM(order_items.item_price) DESC;

#Problem 5
SELECT email_address, COUNT(orders.order_id) AS order_count,
((SUM(order_items.item_price) - SUM(order_items.discount_amount)) * SUM(order_items.quantity)) AS total_amount
FROM customers 
	JOIN orders
	ON customers.customer_id = orders.customer_id
    JOIN  order_items
	ON orders.order_id = order_items.order_id
AND order_items.item_price > 400
GROUP BY email_address
HAVING COUNT(orders.order_id) > 1
ORDER BY SUM(order_items.item_price) DESC;

#Problem 6
SELECT (products.product_name) AS product_name,
       SUM((products.list_price -  products.discount_percent ) * quantity) AS total_amount
FROM   products 
	JOIN order_items
	ON products.product_id = order_items.product_id
GROUP  BY (product_name) with rollup;

#Problem 7
SELECT email_address, COUNT(order_items.product_id) AS product_count
FROM customers 
	JOIN orders
	ON customers.customer_id = orders.customer_id
	JOIN order_items
    ON orders.order_id= order_items.order_id
GROUP BY email_address
HAVING COUNT(orders.customer_id) > 1;


 
 
 
 
 
 