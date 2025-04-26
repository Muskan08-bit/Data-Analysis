-- WHERE CLAUSE

SELECT *
FROM parks_and_recreation.employee_salary
WHERE FIRST_NAME = 'Leslie';



SELECT *
FROM parks_and_recreation.employee_salary
WHERE SALARY <= 50000;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01';


-- AND OR NOT -- LOGICAL OPERATORS
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (FIRST_NAME = 'LESLIE' AND AGE = 44) OR AGE > 55;



-- LIKE STATEMENT
-- % and _ (anything and specific respectively)
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE FIRST_NAME like 'a%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE FIRST_NAME like 'a___%';


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date like '1989 %';