-- UNIONS
-- It is used to combine rows of data from separate tables or same tables

-- UNION COMES WITH BY DEFAULT DISTINCT KEYWORD
SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

-- WANT DATA WITHOUT DISTICNCT

SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;


-- USE CASE
SELECT first_name, last_name, 'Old Man' as Label
FROM parks_and_recreation.employee_demographics
WHERE AGE > 40 and gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' as Label
FROM parks_and_recreation.employee_demographics
WHERE AGE > 40 and gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' as Label
FROM parks_and_recreation.employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;
