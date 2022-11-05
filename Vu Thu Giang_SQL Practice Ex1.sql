1. Create a query that displays the last name and hire date of any employee in the same department as the employee with name = Zlotkey and excluding employee Zlotkey from the result returns.

select last_name, hire_date from employees where department_id in (select department_id from employees where last_name = 'Zlotkey') and last_name <> 'Zlotkey'

2.Create a report that displays the employee number, last name, and salary of all employees who earn more than the average salary. Sort the results in order of ascending salary.

select employee_id, last_name, salary from employees 
where salary> (select AVG(salary) from employees) 
order by salary asc

3. Write a query that displays the employee number and last name of all employees who work in a department with any employee whose last name contains the letter “u”

select employee_id, last_name from employees
where department_id in (select department_id from employees where last_name like '%u%')

4. The HR department needs a report that displays the last name, department number, and job ID of all employees whose department location ID is 1700.
select e.last_name, d.department_id, e.job_id
from employees e  join departments d
on (e.department_id=d.department_id)
where d.location_id=1700

5.Create a report for HR that displays the last name and salary of every employee who reports to King.
Select last_name, salary from employees where manager_id in
(select employee_id from employees where last_name = 'King')

select e.last_name, e.salary from employees e inner join employees manager on e.manager_id=manager.employee_id
where manager.last_name ='King'

6.Create a report for HR that displays the department number, last name, and job ID for every employee in the Executive department.
SELECT e.department_id, e.last_name, e.job_id
FROM employees e JOINdepartments d ON (e.department_id=d.department_id)
WHERE d.department_name = 'Executive'

7. Create query to display the employee number, last name, and salary of all the employees who earn more than the average salary and who work in a department with any employee whose last name contains a letter “u”.
SELECT employee_id, last_name, salary FROM employees
WHERE salary> (SELECT AVG(salary) FROM employees) 
AND department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%')

8.Find the highest, lowest, sum, and average salary of all employees. Label the columns as Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number
SELECT ROUND(MAX(salary),0) AS 'Maximum', 
ROUND(MIN(salary),0) AS 'Minimum', 
ROUND(SUM(salary),0) AS 'Sum', 
ROUND(AVG(salary),0) AS 'Average' 
FROM employees

9.Write a query that displays the last name (with the first letter in uppercase and all the other letters in lowercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” 
Give each column an appropriate label. Sort the results by the employees’ last names.
SELECT UPPER(LEFT(last_name,1))+LOWER(SUBSTRING(last_name,2,LEN(last_name))) AS "Last Name", 
LEN(last_name) AS "Length of the Last Name" 
FROM employees 
WHERE last_name like 'J%' or last_name like 'A%' or last_name like 'M%' 
ORDER BY last_name

10. The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary
select employee_id, last_name, salary, (salary*15.5%) as New Salary from employees
SELECT employee_id, last_name, salary, salary+(salary*15.5/100) AS "New Salary" 
FROM employees

11.The HR department needs a report with the following specifications:
•	Last name and department ID of all employees from the employees table, regardless of whether or not they belong to a department
•	Department ID and department name of all departments from the departments table, regardless of whether or not they have employees working in them
Write a compound query to accomplish this.
SELECT e.last_name, e.department_id, d.department_name
FROM employees e  JOIN departments d
ON (e.department_id=d.department_id)

12. Produce a list of employees who joined the company later than their manager and who work in Toronto. Display the employee_id by using the set operators. 
SELECT e.employee_id FROM employees e JOIN departments d ON (e.department_id = d.department_id) JOIN locations l ON (d.location_id = l.location_id) 
WHERE l.city = 'Toronto' 
AND e.hire_date > (SELECT hire_date FROM employees WHERE employee_id = e.manager_id)



