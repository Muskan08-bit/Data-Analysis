-- CASE STATEMENTS
-- It allows to add logic in select statement like an if else statement

SELECT first_name,
last_name,
age,
CASE 
	WHEN age <= 30 THEN 'Young'
    WHEN age between 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END AS Age_Bracket
FROM parks_and_recreation.employee_demographics;

-- pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_Salary,
CASE
	When dept_id = 6 THEN salary * .10
END As Bonus
FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.employee_salary;
SELECT *
FROM parks_and_recreation.parks_departments;