-- STORED PROCEDURES
-- These are way to store your sql code that you can reuse over and over again and 
-- when you save it you can call that store procedure and its going to execute all the code 
-- that you wrote within your stored procedures

SELECT *
FROM parks_and_recreation.employee_salary
where salary >= 50000;

-- store above query in procedures


CREATE PROCEDURE large_salaries()
SELECT *
FROM parks_and_recreation.employee_salary
where salary >= 50000;

-- here we call the procedure and the below query executes
CALL large_salaries();


-- here first query is comes in procedure large_salaries2() and the second number query is executing normally
CREATE PROCEDURE large_salaries2()
SELECT *
FROM parks_and_recreation.employee_salary
where salary >= 50000;
SELECT *
FROM parks_and_recreation.employee_salary
where salary >= 50000;


-- now we want to use above both queries together in partition 
-- HERE, begin is telling where procedure is starting and end is telling where procedure is ending
-- through delimiter we are changing syntax to end query like first it was ';' then i have changed it to '$$' and then again back to ';'
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
SELECT *
FROM parks_and_recreation.employee_salary
where salary >= 50000;
SELECT *
FROM parks_and_recreation.employee_salary
where salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries3()


-- PARAMETER
-- These are variables that are passed as an input into a stored procedure and they allow the stored procedure to accept an input value and place it into code

DELIMITER $$
CREATE PROCEDURE large_salaries4(p_employee_id INT)
BEGIN
SELECT salary
FROM parks_and_recreation.employee_salary
where employee_id = p_employee_id
;
END $$
DELIMITER ;

CALL large_salaries4(1)