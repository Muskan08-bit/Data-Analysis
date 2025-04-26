-- SUBQUERIES
-- query into another query

-- here, the whole nested query is an operand so can only contain 1 column
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN 
				(SELECT employee_id
                FROM parks_and_recreation.employee_salary
                WHERE dept_id = 1)
;


-- IN SELECT STATEMENT

SELECT first_name, salary, 
(SELECT avg(salary)
	FROM parks_and_recreation.employee_salary)
FROM parks_and_recreation.employee_salary
GROUP BY first_name, salary;


-- IN FROM STATEMENT

SELECT gender, AVG(AGE), MAX(AGE), MIN(AGE), COUNT(AGE)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- here, `max(age)` is the column name from nested query result and aim is to find both male and female both's max age's average
SELECT AVG(max_age)
from 
(SELECT gender, 
AVG(AGE) AS avg_age, 
MAX(AGE) AS max_age, 
MIN(AGE) AS min_age, 
COUNT(AGE)
FROM parks_and_recreation.employee_demographics
GROUP BY gender) as Agg_table;
-- there are better ways to perform the above operation using temp tables and CTEs