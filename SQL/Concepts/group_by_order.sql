-- GROUP BY 


SELECT *
FROM parks_and_recreation.employee_demographics;

# the select list is not in group by clause and contains non-aggregated column means that when 
# you are selecting a column if its not an aggregated column like average in the select
# statement it has to be in the group by clause i.e. in select gender should be there
SELECT first_name
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT gender, avg(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;


SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary;

SELECT gender, avg(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;



-- ORDER BY: sorts in either aescending order or descending order
-- after ordering by gender it is order by age like all females first and then age in aescending order
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age;

-- gender in aescending order and then age in descending order
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age Desc;

-- in this, age is in aescending order but after that gender is not because all ages are unique and suppose if ages are duplicate
-- then only gender aesending order will be there like first female and then male and so, order is important
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age, gender;

-- (do not recommended) that is you know the column position then no need to write down whole column name
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5, 4;