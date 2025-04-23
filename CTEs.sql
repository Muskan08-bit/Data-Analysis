-- CTES: Common table expressions they are going to allow you to define 
-- a subquery block that you can then reference within the main query and we are going to name this subquery
-- block and it will be a little bit more standardized a little bit formatted then actually using a subquery



-- WITH to define a CTE
-- CTEs are unique because you can only use the CTE immediately after you create it
-- Here, the subquery is like building our own table
-- to find average of both female and male gender
WITH CTE_Example AS
(
SELECT gender, avg(salary) avg_salary, Max(salary) max_salary, min(salary) min_salary, count(salary) count_salary
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT avg(avg_salary)
FROM CTE_Example;


-- getting same output using subquery
SELECT avg(avg_salary)
FROM (
SELECT gender, avg(salary) avg_salary, Max(salary) max_salary, min(salary) min_salary, count(salary) count_salary
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery;

-- cannot be used below CTE only used after creating it
SELECT avg(avg_salary)
FROM CTE_Example;


-- creating multiple CTEs in just one CTEs
WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 as
(
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id;
    
    
-- by passing argument in CTE no, need to provide aliases and it will overwrite column names
WITH CTE_Example (gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS
(
SELECT gender, avg(salary) avg_salary, Max(salary) max_salary, min(salary) min_salary, count(salary) count_salary
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example;