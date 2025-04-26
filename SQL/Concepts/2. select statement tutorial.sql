SELECT first_name,
last_name, birth_date,
age,
(age + 10) * 10 + 10
From parks_and_recreation.employee_demographics;
#PEMDAS: parenthesis, exponent, division, multiplication, addition and subtraction


SELECT distinct gender
FROM parks_and_recreation.employee_demographics;

# first_name and gender are group together for distinct
SELECT DISTINCT FIRST_NAME, GENDER
FROM parks_and_recreation.employee_demographics;
