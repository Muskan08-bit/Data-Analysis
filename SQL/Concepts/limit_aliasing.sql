-- Limit & Aliasing
-- LIMIT : how many rows you want in your output

-- TOP OLDEST PEOPLE
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY AGE DESC
LIMIT 3;

-- HERE 2, 1 MEANS THAT IN RESULT AFTER THE SECOND ROW, ONLY ONE ROW WILL BE PRINTED
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY AGE DESC;



-- ALIASING: CHANGE THE NAME OF THE COLUMN

SELECT GENDER, AVG(AGE) as avg_age
FROM parks_and_recreation.employee_demographics
group by gender
having avg_age > 40;

-- same as above query even after removing 'as'
SELECT GENDER, AVG(AGE) avg_age
FROM parks_and_recreation.employee_demographics
group by gender
having avg_age > 40;