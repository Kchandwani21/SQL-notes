#Kanchi Chandwani
#CS 269: Final Exam
# 12/19/16


#Problem 1

#create the database
DROP DATABASE IF EXISTS final_db;
CREATE DATABASE final_db;

#Problem 2 ( create the three tables) 
USE final_db;

DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS committees;
DROP TABLE IF EXISTS teachers_committees;

CREATE TABLE teachers
(
 teacher_id			INT 			PRIMARY KEY 	AUTO_INCREMENT,
 first_name			VARCHAR(50)		NOT NULL,
 last_name			VARCHAR(50)		NOT NULL
	 #CONSTRAINT pk_teacher_id PRIMARY KEY (teacher_id)
 );
 
 CREATE TABLE committees
 (
  committee_id		INT 			PRIMARY KEY		AUTO_INCREMENT,
  committee_name	VARCHAR(50)		NOT NULL
	 #CONSTRAINT pk.committee_id PRIMARY KEY (committee_id)
  );
 
 CREATE TABLE teachers_committees
 (
  teacher_id		INT 			NOT NULL,
  committee_id		INT				NOT NULL,
  
  CONSTRAINT teachers_committees_fk_teachers FOREIGN KEY (teacher_id)
	REFERENCES teachers(teacher_id),
  CONSTRAINT teachers_committees_fk_committees FOREIGN KEY (committee_id)
	REFERENCES committees(committee_id)
 );
 
#Problem 3 
#CREATE INDEX committees_committee_name_ix ON committees(committees_committee_name);

#Problem 4 ( write an insert statement that adds two teachers and 2 committees) 
USE final_db;
INSERT INTO teachers VALUES (DEFAULT, 'Jane', 'Doe');
INSERT INTO teachers VALUES (DEFAULT, 'John', 'Smith');

INSERT INTO committees VALUES (DEFAULT, 'planning_committee');
INSERT INTO committees VALUES (DEFAULT, 'disciplinary_committee');

#Problem 5 ( insert statement so that teacher 1 belongs to committees 1 & 2 and teacher 2 belongs to committees 1 &2) 
USE final_db;
INSERT INTO teachers_committees VALUES(1, 1);
INSERT INTO teachers_committees VALUES(1, 2);
INSERT INTO teachers_committees VALUES(2, 1);
INSERT INTO teachers_committees VALUES(2, 2);

#Problem 6 ( join all three tables, display committee name, display teacher first and last names, and sort by committee name)
SELECT c.committee_name, t.first_name, t.last_name
FROM committees c
  JOIN teachers_committees tc
    ON c.committee_id=tc.committee_id
  JOIN teachers t 
	ON tc.teacher_id = t.teacher_id
ORDER BY c.committee_name; 

#Problem 7 ( in AP database make a view that displays vendor_name, invoice_number, invoice_date, invoice_total, name the view vendor_invoices)
CREATE OR REPLACE VIEW vendor_invoices
AS
SELECT vendor_name, invoice_number, invoice_date, invoice_total
FROM vendors JOIN invoices
	ON vendors.vendor_id= invoices.vendor_id;

#Problem 8 (create a procedure that uses a transaction, it should insert a record in the terms table. no parameters passed, hardcode insert statement, & use varaibles if needed)
USE ap;
DROP PROCEDURE IF EXISTS insert_terms;
DELIMITER //
CREATE PROCEDURE insert_terms()
BEGIN
DECLARE sql_error INT DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
START transaction;
	INSERT INTO terms
	VALUES (DEFAULT, 'Net due 120 days', 120);
    
	IF sql_error = FALSE THEN
COMMIT;
	SELECT 'The transaction was committed';
ELSE 
	ROLLBACK;
	SELECT 'The transaction was rolled back';
  END IF;
END //
DELIMITER ;
CALL insert_terms();

#Problem 9 (create trigger in AP database so that any vendor inserted is located in NJ)
USE ap;
DROP TRIGGER IF EXISTS vendor_NJ,
DELIMITER //
CREATE TRIGGER vendor_NJ
	AFTER UPDATE ON vendors
    FOR EACH ROW
BEGIN 
	UPDATE vendors
    SET vendor_state = 'NJ'
    WHERE vendor_id > 0;
END //
DELIMITER ;








