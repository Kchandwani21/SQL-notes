#Kanchi Chandwani
# HW Chapter 9

#problem 1
SELECT list_price, discount_percent,
ROUND((list_price *discount_percent/100),2) AS discount_amount
FROM products;

#problem 2
SELECT order_date, 
	DATE_FORMAT(order_date, '%Y') AS order_Year, 
	DATE_FORMAT(order_date, '%b-%d-%Y') AS order_Date_formatted,
	DATE_FORMAT(order_date, '%l:%i %p') AS order_Time,
	DATE_FORMAT(order_date, '%m/%d/%y %H:%i') AS order_date_time
FROM orders;

#Problm 3
SELECT card_number,
	LENGTH(card_number) AS card_number_length,
	RIGHT(card_number, 4) AS last_four_digits,
	 CONCAT('XXXX-XXX-XXXX-XXXX-', RIGHT(card_number, 4))AS formatted_number
FROM orders;

#Problem 4
SELECT order_id order_date,
	DATE_ADD(order_date, interval 2 DAY) AS apptoximate_ship_date,
	ship_date,
	DATEDIFF(ship_date, order_date) AS days_to_ship
FROM orders
WHERE MONTH(order_date) =3;





