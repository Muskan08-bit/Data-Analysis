-- TEMPORARY TABLE
-- These tables are only visible to the session that they are created in 
-- Temp tables are mostly used in lot of things but especially as a data analyst for 
-- storing intermediate results for complex queries somewhat like a CTE but also for using it to manipulate data 
-- before insert into a more permanent table

-- There are 2 ways to create a temp table

-- first way (the popular way)
CREATE temporary TABLE temp_table
( first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Alex', 'Freberg', 'Lord of the Rings') ;

-- 2nd way
SELECT *
FROM parks_and_recreation.employee_salary;

create temporary table salary_over_50k
SELECT *
FROM parks_and_recreation.employee_salary
where salary >=50000; 

SELECT *
FROM salary_over_50k;

-- TEMP TABLE last till the session exists and they still exists when you change the tab 
-- but is you close the window and came back in then te temp table no longer exists

-- These are usually used in stored procedures when manipulating data 

-- PRO TIP: with temp tables you can get lot more advanced with this 