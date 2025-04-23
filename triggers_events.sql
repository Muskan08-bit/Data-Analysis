-- TRIGGERS AND EVENTS
-- Triger is a block of code that executes automatically when an event take place on a specific table 

-- when somebody is put into salary table we want it to automatically update the employee demographics
SELECT *
FROM parks_and_recreation.employee_demographics;


SELECT *
FROM parks_and_recreation.employee_salary;

-- after insert on means if any entry inserted after that
-- FOR EACH ROW means that the trigger is going to get activated for each row that is inserted
-- NEW stands for newly inserted row in employee_salary table
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON parks_and_recreation.employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO parks_and_recreation.employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;


INSERT INTO parks_and_recreation.employee_salary 
	(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Jean-Ralphio', 'Saperstein', 'Exntertainment CEO 720', 1000000, NULL);



-- EVENTS
-- a trigger happens when an event takes place whereas an event takes place when its scheduled so, 
-- this is more of a scheduled automator rather than a trigger that happens when an event takes place and this is helpful automation
-- create an event that checks every month or every day and then if a person is over a specific age we are then to delete them from the table and then they will be retired

SELECT *
FROM parks_and_recreation.employee_demographics;

DELIMITER $$
CREATE EVENT delete_retireess
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	SELECT *
FROM parks_and_recreation.employee_demographics
WHERE AGE >= 60;
END $$
DELIMITER ;


SHOW VARIABLES LIKE 'event%';

