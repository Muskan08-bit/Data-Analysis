-- Having vs Where

-- here invalid use of group function because as the procedure is first group will be formed and then average age of that
-- particular group will be calculated but here before group been created querying is asking to filter the average of age i.e > 40
SELECT GENDER, AVG(AGE)
FROM parks_and_recreation.employee_demographics
WHERE AVG(age) > 40
GROUP BY gender;

-- and that's why having clause is created is filter applied after groups were created
SELECT GENDER, AVG(AGE)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;


-- using both where and having clause, here having is only going to work for aggregated functions after the group by clause
SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 75000;