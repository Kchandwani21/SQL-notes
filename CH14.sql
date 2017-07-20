# Kanchi chandwani 
# Chapter 14B: How  to use transactions and locking 
# 12/5/2016

use my_guitar_shop;
drop procedure if exists test ;

delimiter // #reference slide 3 chapter 14

create procedure test()
begin
declare sql_error INT DEFAULT FALSE ;

  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

START transaction;

  DELETE FROM addresses
  WHERE address_id = 11;

  DELETE FROM addresses
  WHERE address_id = 12;

  DELETE FROM customers
  WHERE customer_id = 8;

	 IF sql_error = FALSE THEN
    COMMIT; #slide 4 of chapter 14
    SELECT 'The transaction was committed';
  ELSE
    ROLLBACK;
    SELECT 'The transaction was rolled back';
  END IF;
    END //

delimiter ; #put space here or it won't work
call test ();


#finished in class
