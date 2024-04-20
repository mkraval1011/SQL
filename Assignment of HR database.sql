-- 1. Display all information in the tables EMP and DEPT.    
  select * from employees;
  select * from departments;
  
-- 2. Display only the hire date and employee name for each employee.   
SELECT 
    hire_date, CONCAT(first_name, ' ', last_name) AS emp_name
FROM
    employees;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title   
SELECT 
    CONCAT(first_name,
            ' ',
            last_name,
            ' , ',
            job_id) AS Employee_and_title
FROM
    employees;
 
-- 4. Display the hire date, name and department number for all clerks.   
SELECT 
    hire_date,
    CONCAT(first_name, ' ', last_name) AS emp_name,
    department_id
FROM
    employees
WHERE
    job_id LIKE '%clerk';

-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT   
select * from employees;
select concat(employee_id,' , ',first_name,' , ',last_name,' , ',email,' , ',phone_number,' , ',hire_date,' , ',job_id,' , ',salary,' , ',commission_pct,' , ',manager_id,' , ',department_id) as The_Output from employees;

-- 6. Display the names and salaries of all employees with a salary greater than 2000. 
SELECT 
    CONCAT(first_name, ' ', last_name) AS Name, salary
FROM
    employees
WHERE
    salary > 2000;
  
-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date"
SELECT 
    CONCAT(first_name, ' ', last_name) AS Name,
    hire_date AS start_date
FROM
    employees;
   
-- 8. Display the names and hire dates of all employees in the order they were hired.   
SELECT 
    CONCAT(first_name, ' ', last_name) AS Name, hire_date
FROM
    employees
ORDER BY hire_date;

-- 9. Display the names and salaries of all employees in reverse salary order.   

SELECT 
    CONCAT(first_name, ' ', last_name) AS Name, salary
FROM
    employees
ORDER BY salary DESC;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.   

SELECT 
    CONCAT(first_name, ' ', last_name) AS EName,
    department_id,
    commission_pct,
    salary
FROM
    employees
ORDER BY salary DESC;

-- 11. Display the last name and job title of all employees who do not have a manager   

SELECT 
    last_name, job_id
FROM
    employees
WHERE
    manager_id IS NULL;
 
-- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000 

SELECT 
    last_name, job_id, salary
FROM
    employees
WHERE
    ((job_id = 'SA_REP')
        OR (job_id = 'ST_CLERK'))
        AND (salary NOT IN (2500 , 3500, 5000));

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1) Display the maximum, minimum and average salary and commission earned.    

SELECT 
    MIN(salary), MAX(salary), AVG(salary), commission_pct
FROM
    employees
GROUP BY commission_pct;

-- 2) Display the department number, total salary payout and total commission payout for each department.  

SELECT 
    department_id, SUM(salary), SUM(commission_pct)
FROM
    employees
GROUP BY department_id;
   
-- 3) Display the department number and number of employees in each department.   

SELECT 
    department_id, COUNT(employee_id)
FROM
    employees
GROUP BY department_id;

-- 4) Display the department number and total salary of employees in each department.   

SELECT 
    department_id, SUM(salary)
FROM
    employees
GROUP BY department_id;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name   

SELECT 
    CONCAT(first_name, ' ', last_name) AS ' '
FROM
    employees
WHERE
    commission_pct IS NULL; 

-- 6) Display the employees name, department id and commission. If an Employee doesn't  earn the commission, then display as 'No commission'. Name the columns appropriately
-- We use the COALESCE function to replace NULL values in the commission column with the string 'No commission'. 
-- This ensures that if an employee doesn't earn commission, it will display 'No commission' instead of NULL.  

SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Emp_name',
    department_id,
    COALESCE(commission_pct, 'No commission') AS 'Commissioin'
FROM
    employees;

-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. 
-- Name the columns appropriately

SELECT 
    CONCAT(first_name, ' ', last_name) AS Employee_Name,
    salary,
    CASE
        WHEN commission_pct IS NOT NULL THEN commission_pct * 2
        ELSE 'No commission'
    END AS Commission_Multiplied_By_2
FROM
    employees;
  
-- 8) Display the employee's name, department id who have the first name same as another employee in the same department 

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS 'Emp name',
    e.department_id
FROM
    employees e
        JOIN
    employees m ON e.first_name = m.first_name
        AND e.employee_id != m.employee_id
        AND e.department_id = m.department_id;

-- 9) Display the sum of salaries of the employees working under each Manager.   

SELECT 
    SUM(salary) AS 'Salaries'
FROM
    employees
GROUP BY manager_id;

-- 10) Select the Managers name, the count of employees working under and the department ID of the manager. 

SELECT 
    CONCAT(m.first_name, ' ', m.last_name) AS Manager_name,
    COUNT(*),
    m.department_id
FROM
    employees e
        JOIN
    employees m ON e.manager_id = m.employee_id
GROUP BY m.first_name , m.last_name , m.department_id;

-- 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!   

SELECT 
    CONCAT(m.first_name, ' ', m.last_name) AS 'Manager_name',
    e.last_name AS Employee_name,
    m.department_id,
    m.salary
FROM
    employees e
        JOIN
    employees m ON e.manager_id = m.employee_id
WHERE
    e.last_name LIKE '_a%';

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.   

SELECT 
    department_id, AVG(salary)
FROM
    employees
GROUP BY department_id;

-- 13) Select the maximum salary of each department along with the department id   

SELECT 
    department_id, MAX(salary)
FROM
    employees
GROUP BY department_id;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1

SELECT 
    COALESCE((1.1 * salary) * commission_pct, 1)
FROM
    employees;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, 
-- Give each column an appropriate label.  

SELECT 
    CONCAT(
        UPPER(SUBSTRING(last_name, 2, 1)), 
        LOWER(SUBSTRING(last_name, 3, 4))
    ) AS modified_last_name
FROM 
    employees;

   
-- 2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. 
-- Also displays the month on which the employee has joined.  

SELECT 
    CONCAT('First name: ',
            first_name,
            ';',
            ' Last name: ',
            last_name,
            ' then ',
            first_name,
            ' - ',
            last_name) AS Name,
    hire_date
FROM
    employees;

-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along 
-- with the bonus amount of 1500 each. Provide each column an appropriate label.   

SELECT 
    last_name,
    (salary / 2) AS half_salary,
    (((salary / 2) > 10000)) * (salary * 1.1) AS 'Salary Increase 10%',
    (((salary / 2) < 10000)) * (((salary) * 1.115) + 1500) AS 'Salary Increase 11.5%'
FROM
    employees;

-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name 
-- consists of 'z' replace it with '$!   
-- SUBSTRING(input_string, start, length);

SELECT 
    CONCAT(SUBSTRING(e.employee_id, 1, 2),
            '00',
            SUBSTRING(e.employee_id, 3),
            'E') AS 'Emp Id',
    e.salary,
    REPLACE(CONCAT(m.first_name, ' ', m.last_name),
        'z',
        '$!') AS 'Manager name'
FROM
    employees e
        JOIN
    employees m ON e.manager_id = m.manager_id;

-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, 
-- for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names   

SELECT 
    CONCAT(UPPER(SUBSTRING(last_name, 1, 1)),
            LOWER(SUBSTRING(last_name, 2))) AS Last_Name,
    LENGTH(Last_Name)
FROM
    employees
WHERE
    SUBSTRING(Last_Name, 1, 1) IN ('J' , 'A', 'M')
ORDER BY Last_Name;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY   

SELECT 
    last_name, LPAD(salary, 15, '$') AS SALARY
FROM
    employees;

-- 7. Display the employee's name if it is a palindrome   

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'palindrome';

-- 8. Display First names of all employees with initcaps. 
-- INITCAP is an Oracle function that capitalizes the first letter of each word in a string and lowercases all other letters.

SELECT 
    CONCAT(UPPER(SUBSTRING(first_name, 1, 1)),
            SUBSTRING(first_name, 2)) AS Name
FROM
    employees;
  
-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.   

select * from locations;
-- SUBSTRING_INDEX(string, delimiter, number)
SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(street_address, ' ', 2),
            ' ',
            - 1) AS 'Extraxt word'
FROM
    locations;

-- 10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. 
-- All characters should be in lower case. Display this along with their First Name. 

SELECT 
    CONCAT(LOWER(SUBSTRING(first_name, 1, 1)),
            LOWER(last_name),
            '@systechusa.com') AS 'XYZ'
FROM
    employees;
  
-- 11. Display the names and job titles of all employees with the same job as Trenna.   

SELECT 
    CONCAT(first_name, ' ', last_name) AS Name, job_id
FROM
    employees
WHERE
    job_id = (SELECT 
            job_id
        FROM
            employees
        WHERE
            first_name = 'Trenna');

-- 12. Display the names and department name of all employees working in the same city as Trenna.   

SELECT 
    e.first_name, d.department_name, l.city
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        JOIN
    locations l ON d.location_id = l.location_id
WHERE
    e.department_id = (SELECT 
            department_id
        FROM
            employees
        WHERE
            first_name = 'Trenna');

-- 13. Display the name of the employee whose salary is the lowest.

SELECT 
    CONCAT(first_name, ' ', last_name) AS Name, salary
FROM
    employees
ORDER BY salary
LIMIT 1;
   
-- 14. Display the names of all employees except the lowest paid.

SELECT 
    CONCAT(first_name, ' ', last_name) AS Name, salary
FROM
    employees
WHERE
    salary > (SELECT 
            MIN(salary)
        FROM
            employees);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Write a query to display the last name, department number, department name for all employees.  

SELECT 
    e.last_name, d.department_id, d.department_name
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id;

-- 2. Create a unique list of all jobs that are in department 50. Include the location of the department in the output. 

SELECT DISTINCT 
    j.job_title,
    concat(l.city ,' , ',  l.state_province) AS Department_Location
FROM 
    jobs j
JOIN 
    employees e ON j.job_id = e.job_id
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
WHERE 
    d.department_id = 50;


-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.   

SELECT 
    e.last_name, d.department_name, l.location_id, l.city
FROM
    employees e
        RIGHT JOIN
    departments d ON e.department_id = d.department_id
        RIGHT JOIN
    locations l ON d.location_id = l.location_id
WHERE
    e.commission_pct IS NOT NULL;

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name 

SELECT 
    e.last_name, d.department_name
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.last_name LIKE '%a%';
  
-- 5. Write a query to display the last name,job,department number and department name for all employees who work in Texas.   

SELECT 
    e.last_name,
    e.job_id,
    d.department_id,
    d.department_name,
    l.state_province
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        JOIN
    locations l ON d.location_id = l.location_id
WHERE
    l.location_id = (SELECT 
            location_id
        FROM
            locations
        WHERE
            state_province = 'Texas');

-- 6. Display the employee last name and employee number along with their manager's last name and manager number.  

SELECT 
    e.last_name AS 'Employee name',
    e.employee_id AS 'Emp Number',
    m.last_name AS 'Manager Name',
    m.employee_id AS 'Manager number'
FROM
    employees e
        JOIN
    employees m ON e.manager_id = m.employee_id;

-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).

SELECT 
    e.last_name,
    e.employee_id,
    COALESCE(mgr.last_name, 'No Manager') AS Manager_Last_Name,
    COALESCE(mgr.employee_id, 0) AS Manager_Number
FROM 
    employees e
LEFT JOIN 
    employees mgr ON e.manager_id = mgr.employee_id;

   
-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.  

SELECT 
    last_name, department_id
FROM
    employees
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            employees
        WHERE
            last_name = 'King');
 
-- 9. Create a query that displays the name,job,department name,salary,grade for all employees.  Derive grade based on salary(>=5000=A, >=3000=B,<3000=C)   

-- Add column 
alter table employees add column Grade varchar(5);

-- Update value
UPDATE employees 
SET 
    Grade = CASE
        WHEN (salary >= 5000) THEN 'A'
        WHEN (salary >= 3000) THEN 'B'
        WHEN (salary < 3000) THEN 'C'
    END;
    
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Name,
    e.job_id AS Job,
    d.department_name AS 'Department_name',
    e.salary AS Salary,
    e.Grade AS Grade
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id; 

alter table employees drop column Grade;

-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. 
-- Label the columns as Employee name, emp_hire_date,manager name,man_hire_date

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS 'Employee name',
    e.hire_date AS 'Emp hire date',
    CONCAT(m.first_name, ' ', m.last_name) AS 'Manager name',
    m.hire_date AS 'Man hire date'
FROM
    employees e
        JOIN
    employees m ON e.manager_id = m.employee_id;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES.   

SELECT 
    e.last_name, e.hire_date
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
WHERE
    d.department_name = 'Sales';

-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. 
-- Sort the results in ascending order of salary.   

SELECT 
    employee_id AS 'Emp numbers', last_name, salary
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary) AS 'Avg salary'
        FROM
            employees)
ORDER BY salary ASC;

-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u   

SELECT 
    employee_id, last_name
FROM
    employees
WHERE
    department_id = 80
        AND last_name LIKE '%u%';

-- 4. Display the last name, department number, and job ID of all employees whose department location is Texas.   

SELECT 
    e.last_name, e.department_id, e.job_id, l.state_province
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        JOIN
    locations l ON d.location_id = l.location_id
WHERE
    l.state_province = 'Texas';

-- 5. Display the last name and salary of every employee who reports to KING.  

SELECT 
    e.last_name, e.salary
FROM
    employees e
        JOIN
    employees m ON e.manager_id = m.employee_id
WHERE
    m.last_name = 'King'; 

-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department.   

SELECT 
    e.department_id AS 'Department name', e.last_name, e.job_id
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
WHERE
    d.department_id IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            department_name = 'Operations'); 

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary 
-- and who work in a department with any employee with a 'u' in their name.   

SELECT 
    employee_id, last_name, salary
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees)
        AND department_id = 80
        AND last_name LIKE '%u%';

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.   

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Name,
    d.department_name,
    e.job_id
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.job_id IN (SELECT DISTINCT
            job_id
        FROM
            employees
        WHERE
            department_id = (SELECT 
                    department_id
                FROM
                    departments
                WHERE
                    department_name = 'Sales'));

-- 9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 10 and 30 are given a 5% raise, 
-- employees in department 20 are given a 10% raise, employees in departments 40 and 50 are given a 15% raise, and employees in department 60 are not given a raise.   

SELECT 
    employee_id,salary,
    CASE 
        WHEN department_id IN (10, 30) THEN 5
        WHEN department_id = 20 THEN 10
        WHEN department_id IN (40, 50) THEN 15
        ELSE 0
    END AS raise_percentage
FROM 
    employees;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.   

select last_name,salary from employees order by salary desc limit 3; 

-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column   

SELECT 
    salary,
    CASE
        WHEN commission_pct IS NULL THEN 0
        ELSE (commission_pct * salary)
    END AS 'Commission earned'
FROM
    employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information. 

SELECT 
    e.last_name, m.last_name, m.salary, d.department_name
FROM
    employees e
        JOIN
    (SELECT 
        *
    FROM
        employees
    ORDER BY salary DESC
    LIMIT 3) m ON e.manager_id = m.employee_id
        JOIN
    departments d ON m.department_id = d.department_id;
