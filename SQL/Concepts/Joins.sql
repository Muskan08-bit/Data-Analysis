-- JOINS
-- It allow you to combine two tables or more if they have common column that des not mean the column name has to be 
-- exact same but atleast the data within it are similar that you can use
-- INNER JOINS, OUTER JOINS AND SELF JOINS


-- INNER JOIN is going to return rows that are same in both tables 
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

SELECT ed.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics as ed
INNER JOIN parks_and_recreation.employee_salary as es
	ON ed.employee_id = es.employee_id;
    
    
    
-- OUTER  JOINS: Here 2 joins, 
-- LEFT JOIN: going to take everything from left table even if there is no match in the join but return match from the right table
-- RIGHT JOIN: opposite of left join 

-- HERE TAKING EVERYTHING FROM ED TABLE
SELECT *
FROM parks_and_recreation.employee_demographics as ed
LEFT JOIN parks_and_recreation.employee_salary as es
	ON ed.employee_id = es.employee_id;
    
    
-- RIGHT JOIN : THERE WILL BE RECORD OF E_ID = 2 EVEN IF THERE IS NOT MATCH OF THAT IN ED TABLE
SELECT *
FROM parks_and_recreation.employee_demographics as ed
RIGHT JOIN parks_and_recreation.employee_salary as es
	ON ed.employee_id = es.employee_id;
    
    
    
-- SELF JOIN: It is a join where you tie the table to itself
-- use case of self join playing secret santa
-- in this leslie knope is assigned to ron swanson and so on

SELECT emp1.employee_id as emp_santa,
	emp1.first_name as first_name_santa,
	emp1.last_name as last_name_santa,
	emp2.employee_id as emp_name,
	emp2.first_name as first_name_emp,
	emp2.last_name as first_name_emp
FROM parks_and_recreation.employee_salary as emp1
JOIN parks_and_recreation.employee_salary as emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
    
    
-- Joining multiple tables together

-- here we cannot join the ed and parks_department table because there is no common column only es and park_department table have common column
SELECT *
FROM parks_and_recreation.employee_demographics as ed
INNER JOIN parks_and_recreation.employee_salary as es
	ON ed.employee_id = es.employee_id
INNER JOIN parks_and_recreation.parks_departments as pd
	ON es.dept_id = pd.department_id;
    

SELECT *
FROM parks_and_recreation.parks_departments;