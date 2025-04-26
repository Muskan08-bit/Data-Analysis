-- WINDOW FUNCTIONS: kind of like group by except that they do not roll everything up into one row
-- These allow us to look at a partition or group but they each keep their own unique rows in the output

SELECT gender, avg(salary) avg_salary
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
GROUP BY gender;

-- doing same with window function
-- HERE, OVER() MEANS LOOK AT AVERAGE SALARY OVER EVERYTHING
SELECT gender, avg(salary) OVER()
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;

-- now we will do partition by means grouping it
-- its output is same as group by query but it is not rolled up in 2 rows for female and male
-- if we execute below query with group by then the extra columns which are not used by aggregated function 
-- must be used in group by clause and then the whole output will be different
SELECT dem.first_name, dem.last_name, gender, avg(salary) OVER(partition by GENDER)
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;


-- rolling total means it is going to start on a specific value and add on values from subsequent rows based on partition
SELECT dem.first_name, dem.last_name, gender, salary,
sum(salary) OVER(partition by GENDER ORDER BY dem.employee_id) AS Rolling_total
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    
-- ROW_NUMBER A TYPE OF AGGREGATED FUNCTION AND IT CANNOT HAVE ANY VALUE DUPLICATE I.E. ALL VALUE UNIQUE
SELECT dem.employee_id ,dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;

SELECT dem.employee_id ,dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY GENDER ORDER BY SALARY DESC)
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
 
 -- rank function do give duplicate rank to the rows if order by column has same entry
-- the thing unique about rank function is it does not give value to the row numerically, 
-- it give values positionally see as after 5 and 5 there is 7 
SELECT dem.employee_id ,dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY GENDER ORDER BY SALARY DESC) as row_num,
RANK() OVER(PARTITION BY GENDER ORDER BY SALARY DESC) AS rank_num
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;

-- DENSE RANK FUNCTION WILL PROVIDE VALUE NUMERICALLY NOT POSITIONALLY LIKE AFTER 5 AND 5 THERE IS 6
SELECT dem.employee_id ,dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY GENDER ORDER BY SALARY DESC) as row_num,
RANK() OVER(PARTITION BY GENDER ORDER BY SALARY DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY GENDER ORDER BY SALARY DESC) AS dense_rank_num
FROM parks_and_recreation.employee_demographics as dem
JOIN parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;