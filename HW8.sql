#Kanchi  Chandwani
#CS 269: Homework #7 (Chapter 8) 
#11/7/2016


#Problem 1
SELECT list_price, 
	FORMAT(list_price,1) AS total_format, 
	CONVERT(list_price, SIGNED) AS total_convert, 
    CAST(list_price AS SIGNED) AS total_cast 
FROM products;


#Problem 2
SELECT date_added, 
	CAST( date_added  AS CHAR(10)) AS added_date,
    CAST( date_added  AS TIME) AS added_time,
    CAST( date_added  AS CHAR(7)) AS added_char7
FROM products;