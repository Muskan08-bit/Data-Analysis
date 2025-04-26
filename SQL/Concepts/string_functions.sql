-- STRING FUNCTIONS
-- These are built-in functions within SQL that help us use strings and work with strings differently

-- length
SELECT length('SKYFALL');

SELECT first_name, length(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY 2;

-- USE CASE OF LENGTH FUNCTION IS TO CHECK PHONE NUMBERSS ARE THEY EXACTLY 10 IN LENGTH


-- UPPER AND LOWER
SELECT UPPER('SKY');
SELECT LOWER('SKY');

SELECT first_name, UPPER(first_name)
FROM parks_and_recreation.employee_demographics;

-- USE CASE: SOLVE STANDARDIZATION ISSUE IN A SINGLE COLUMN


-- TRIM- LEFT TRIM AND RIGHT TRIME: It removes the white spaces from the start and at the end of string
SELECT TRIM('          sky           ');
SELECT LTRIM('          sky           ');
SELECT RTRIM('          sky           ');



-- SUBSTRING FUNCTION
-- Here, 4 is how many characters from left/right hand side we want to select
-- Here, in substring function 3 is the position that we want to start at and then we specify how many characters we want to go (really useful)
SELECT first_name, 
LEFT(FIRST_NAME, 4),
RIGHT(first_name, 4),
substring(first_name, 3, 2),
birth_date,
substring(birth_date, 6, 2) as birth_month
FROM parks_and_recreation.employee_demographics;


-- REPLACE: It will replace specific characterswith different characters you want
-- In column first_name, a will be replaced with z
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM parks_and_recreation.employee_demographics;


-- LOCATE: find position 'x' in Alexander used in temp tables and CTEs
SELECT LOCATE('x', 'Alexander');

SELECT first_name, LOCATE('An' , first_name);


-- CONCAT: Concatenation of multiple columns (REALLY HELPFUL)
SELECT FIRST_NAME, LAST_NAME,
CONCAT(FIRST_NAME, LAST_NAME)
FROM parks_and_recreation.employee_demographics;