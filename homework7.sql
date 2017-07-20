#Kanchi Chandwani
# CS 269: Chapter 7: How to code Subqueries
# 24 October 2016


#Problem 1
SELECT DISTINCT category_name
FROM categories
WHERE categories.category_id IN
	(SELECT products.category_id
	 FROM products)
ORDER BY category_name;

#Problem 2
SELECT product_name, list_price
FROM products
WHERE list_price > ( 
	SELECT AVG(products.list_price)
	FROM products)
    ORDER BY list_price DESC;

#Problem 3
SELECT categories.category_name
FROM categories
WHERE not exists
	(SELECT 1 FROM products
     WHERE products.category_id = categories.category_id);

#Problem 4
SELECT customers.email_address, 
	MAX(order_cost) AS max_order_total
FROM customers
	INNER JOIN orders
	ON customers.customer_id = orders.customer_id
    JOIN(
		SELECT orders.order_id,
			order_items.item_price * quantity AS order_cost
		FROM orders,
			order_items
		WHERE order_items.order_id = orders.order_id)max_order_total
		ON max_order_total.order_id = orders.order_id
GROUP BY customers.email_address;

#Problem 5
SELECT p1.product_name,p1.discount_percent
FROM products AS p1
WHERE p1.discount_percent NOT IN
	(SELECT p2.discount_percent
	 FROM products AS p2
     WHERE p1.product_name <> p2.product_name)
ORDER BY product_name;

#Problem 6
SELECT email_address, order_id, order_date
FROM customers AS C NATURAL JOIN orders
WHERE order_date = (
	SELECT min(order_date)
	FROM orders AS O
	WHERE C.customer_id = O.customer_id
)
GROUP BY email_address, order_id, order_date;



