
------Employees Table --------

--1.  Write create table syntax for employee table and Incentive table
CREATE TABLE employee(
emp_id NUMBER ,
first_name VARCHAR2(20),
last_name VARCHAR2(20),
SALARY NUMBER,
joining_date DATE,
department VARCHAR2(20)
);

--3.	Get all employee details from the employee table

SELECT * FROM employee

--2.	Writesyntax forinsert data into table of employee table 

INSERT ALL 
INTO employee VALUES(1,'Jhon', 'Abrham', 1000000, to_date('01-JAN-13','DD-MON-YY'),'Banking')
INTO employee VALUES(2,'Michel', 'Clark', 80000, to_date('01-JAN-13','DD-MON-YY'),'Insurance')
INTO employee VALUES(3,'Roy', 'Thomas', 70000, to_date('01-FEB-13','DD-MON-YY'),'ba nking')
INTO employee VALUES(4,'Tom', 'Jose', 60000, to_date('01-FEB-13','DD-MON-YY'),'Insurance')
INTO employee VALUES(5,'Jerry', 'Pinto', 65000, to_date('01-FEB-13','DD-MON-YY'),'Insurance')
INTO employee VALUES(6,'Philip', 'Mathew', 75000, to_date('01-JAN-13','DD-MON-YY'),'Services')
SELECT * FROM dual;

CREATE TABLE incentives(
emp_ref_id NUMBER,
incentive_date DATE,
incentive_amount NUMBER 
);

SELECT * FROM incentives

--2.	Writesyntax forinsert data into Incentive table

INSERT ALL
INTO incentives VALUES(1,to_date('01-FEB-13','DD-MON-YY'),5000)
INTO incentives VALUES(2,to_date('01-FEB-13','DD-MON-YY'),3000)
INTO incentives VALUES(3,to_date('01-FEB-13','DD-MON-YY'),4000)
INTO incentives VALUES(1,to_date('01-JAN-13','DD-MON-YY'),4500)
INTO incentives VALUES(2,to_date('01-JAN-13','DD-MON-YY'),3500)
SELECT * FROM DUAL;

-----DATA RETRIVAL QUERIES----------

--4.	Get First_Name,Last_Name from employee table

SELECT first_name, last_name
FROM employee;

--5.	Get First_Name from employee table using alias name “Employee Name”
SELECT first_name AS employee_name 
FROM employee;

--6.	Get First_Name from employee table in upper case
SELECT UPPER(first_name) 
FROM employee;

--7.	Select first 3 characters of FIRST_NAME from EMPLOYEE
SELECT SUBSTR(first_name,1,3) FROM employee

SELECT SUBSTR(first_name, 1, 4) FROM employee  --finds sub string

--8.	Get position of 'o' in name 'John' from employee table

SELECT INSTR(first_name,'o') AS position_of_o FROM employee
WHERE ROWNUM <= 1;

SELECT INSTR('vivek','v', 1,2) FROM dual; --position

--9.	Get FIRST_NAME from employee table after removing white spaces from right side.

SELECT RTRIM(first_name) FROM employee;
SELECT LTRIM(first_name) FROM employee;
SELECT TRIM(first_name) FROM employee;

--10.	Get First_Name from employee table after replacing 'o' with '$'
SELECT  REPLACE(first_name, 'o','$') AS first_name 
FROM employee; 

--11.	Get First_Name and Last_Name as single column from employee table separated by a '_'
SELECT first_name ||'_'|| last_name AS full_name 
FROM employee;

--12.	Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table
SELECT 
first_name,
EXTRACT(YEAR FROM joining_date) AS joining_year,
EXTRACT(MONTH FROM joining_date)AS joining_month,
EXTRACT(DAY FROM joining_date)  AS joining_date
FROM employee;
 
SELECT * FROM employee;
--13.	Get all employee details from the employee table order by First_Name Ascending

SELECT * FROM employee
ORDER BY first_name ASC;

--14.	Get all employee details from the employee table order by First_Name Ascending and Salary Descending?
SELECT * FROM employee
ORDER BY first_name ASC, salary DESC;

--15.	Get employee details from employee table whose employee name is “John”
SELECT *  FROM employee
WHERE first_name = 'Jhon';  --strings are case sensetive!!

--16.	Get employee details from employee table whose employee name are “John” and “Roy”
SELECT *  FROM employee
WHERE first_name = 'Jhon'
OR first_name = 'Roy';

SELECT *  FROM employee
WHERE first_name IN ('Jhon','Roy');

--17.	Get employee details from employee table whose employee name are not “John” and “Roy”.
SELECT *  FROM employee
WHERE first_name != 'Jhon'
AND first_name != 'Roy';

SELECT * FROM employee
WHERE first_name NOT IN ('Jhon','Roy');

--18.	Get employee details from employee table whose first name starts with 'J'.
SELECT * FROM employee
WHERE first_name LIKE 'J%';

--19.	Get employee details from employee table whose first name contains 'o'.
SELECT * FROM employee
WHERE first_name LIKE '%o%';

--20.	Get employee details from employee table whose first name ends with 'n'.
SELECT * FROM employee
WHERE first_name LIKE '%n';

--21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.
SELECT * FROM employee
WHERE first_name LIKE '___%n';

--22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
SELECT * FROM employee
WHERE first_name LIKE '%J___';

--23.	Get employee details from employee table who’s Salary greater than 600000.
SELECT * FROM employee
WHERE salary > 600000;

--24.	Get employee details from employee table whose joining year is “2013”.
SELECT * FROM employee
WHERE EXTRACT(YEAR FROM joining_date) = 2013;

--25.	Get employee details from employee table whose joining month is “January”.
SELECT * FROM employee
WHERE EXTRACT(MONTH FROM joining_date) = 01;

--26.	Get employee details from employee table who joined before January 1st 2013.
SELECT *
FROM employee
WHERE joining_date < TO_DATE('01-JAN-2013', 'DD-MON-YYYY');

--27.	Get employee details from employee table who joined after January 31st
SELECT *
FROM employee
WHERE joining_date > TO_DATE('31-JAN', 'DD-MON');

--28.	Get Joining Date and Time from employee table

SELECT
  TO_char(joining_date, 'DD-MON-YYYY') AS joining_date,
  TO_char(joining_date, 'HH24:MI:SS') AS joining_time
FROM employee; 

SELECT
  CAST(joining_date AS TIMESTAMP) AS joining_date_and_time
FROM employee;

--29.	Get Joining Date, Time including milliseconds from employee table
SELECT
  CAST(joining_date AS TIMESTAMP) AS joining_date_and_time
FROM employee;

--30.	Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
SELECT * FROM employee
SELECT * FROM incentives

SELECT e.joining_date,
       i.incentive_date,
       ( i.incentive_date - e.joining_date) AS difference
FROM employee e
JOIN incentives i
ON e.emp_id = i.emp_ref_id;

--31.	Get department, total salary with respect to a department from employee table.
SELECT department,
       SUM(salary) AS total_salary
FROM employee
GROUP BY department ;

--32.	Get department, total salary with respect to a department from employee table order by total salary descending.
SELECT department,
SUM(salary) AS total_salary
FROM employee
GROUP BY department
ORDER BY total_salary DESC

--33.	Get department, no of employees in a department, total salary with respect to 
--a department from employee table order by total salary descending.
SELECT 
      department,
      COUNT(*) AS no_of_employee,
      SUM(salary) AS total_salary
FROM employee
GROUP BY department
ORDER BY total_salary DESC;

--34.	Get department wise average salary from employee table order by salary ascending?
SELECT 
 department,
 AVG(salary) AS avg_salary
FROM employee
GROUP BY department
ORDER BY avg_salary ASC;
      
      
--35.	Get department wise maximum salary from employee table order by salary ascending?
SELECT 
 department,
 MAX(salary) AS max_salary
FROM employee
GROUP BY department
ORDER BY max_salary ASC;

--36.	Get department wise minimum salary from employee table order by salary ascending?

SELECT 
 department,
 MIN(salary) AS max_salary
FROM employee
GROUP BY department
ORDER BY max_salary ASC;

SELECT * FROM employee
--37.	Select no of employees joined with respect to year and month from employee table.
SELECT COUNT(*) AS emp_joined,
       EXTRACT(YEAR FROM joining_date) AS YEAR,
       EXTRACT( MONTH FROM joining_date) AS MONTH
FROM employee
GROUP BY joining_date;

SELECT 
      COUNT(*) AS emp_joined,
      to_char(joining_date,'MON') AS emp_joined_month,
      to_char(joining_date,'YYYY') AS emp_joined_year
FROM employee
GROUP BY joining_date;

--38.	Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
SELECT 
      department,
      SUM(salary) AS total_salary
FROM employee
GROUP BY department
HAVING SUM(salary) >=
 80000  --(having used to filter grouped data not where!!!)
ORDER BY total_salary;

--39.	Select employee details from employee table if data in incentive table?
SELECT DISTINCT e.emp_id,
       e.fir st_name,
       e.last_name,
       e.salary,
       e.joining_date,
       e.department
FROM incentives i 
JOIN employee e
ON i.emp_ref_id = e.emp_id;

SELECT * FROM incentives

SELECT * FROM employee e    --(Best practice)
WHERE EXISTS (SELECT 1
              FROM incentives i
              WHERE i.emp_ref_id = e.emp_id);

--40.	Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of 
--salary from employee table
SELECT 
      first_name,
      salary,
         CASE
           WHEN first_name = 'Jhon' THEN salary * 0.2
           WHEN first_name = 'Roy' THEN salary * 0.2
           ELSE salary * 0.15
           END AS calculated_salary
FROM employee
ORDER BY salary DESC;

--41.	Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as
-- 'Services Dept' from employee table.
SELECT 
      SUM(CASE WHEN department = 'Banking' THEN 1 ELSE 0 END) AS "Bank Dept",
       SUM(CASE WHEN department = 'Insurance' THEN 1 ELSE 0 END) AS "Insurance Dept",
        SUM(CASE WHEN department = 'Services' THEN 1 ELSE 0 END) AS "Services Dept"
FROM employee;

SELECT Department,
      CASE 
        WHEN department = 'Banking' THEN   'Bank Dept'
         WHEN department = 'Insurance' THEN 'Insurance Dept'
          WHEN department = 'Services' THEN  'Services Dept'
END AS RESULT
FROM employee;

SELECT * FROM employee
--42.	Delete employee data from employee table who got incentives in incentive table

DELETE * FROM employee
WHERE EXISTS (SELECT 1
              FROM incentives i
              WHERE i.emp_ref_id = e.emp_id)
ROLLBACK;

DELETE FROM employee
WHERE emp_id IN (
                  SELECT emp_ref_id
                  FROM incentives);
--43.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives.
SELECT
      e.first_name,
      i.incentive_amount
FROM employee e
RIGHT JOIN incentives i
ON e.emp_id = i.emp_ref_id;

--44.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT 
      e.first_name,
      i.incentive_amount
FROM employee e
RIGHT JOIN incentives i
ON e.emp_id = i.emp_ref_id
WHERE i.incentive_amount > 3000;

--45.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
SELECT 
      e.first_name,
      i.incentive_amount
FROM employee e
LEFT JOIN incentives i
ON e.emp_id = i.emp_ref_id;

SELECT * FROM employee

--46.	Select first_name, incentive amount from employee and incentives table for 
--all employees even if they didn't get incentives and set incentive amount as 0 
--for those employees who didn't get incentives.
SELECT 
      e.first_name,
      NVL(i.incentive_amount, 0)
FROM employee e
LEFT JOIN incentives i    --(Left join Because we need all from employee table)
ON e.emp_id = i.emp_ref_id
WHERE i.emp_ref_id IS NULL;

--47.	Select first_name, incentive amount from employee and incentives table for 
--all employees who got incentives using left join
SELECT 
      e.first_name,
      i.incentive_amount
FROM employee e
LEFT JOIN incentives i
ON e.emp_id = i.emp_ref_id
WHERE incentive_amount IS NOT NULL

--48.	Select max incentive with respect to employee from employee and 
--incentives table using sub query.

SELECT e.emp_id,
       e.first_name,
       e.last_name,
       i.incentive_amount
FROM employee e
JOIN incentives i 
ON e.emp_id = i.emp_ref_id
WHERE   i.incentive_amount = (SELECT MAX(incentive_amount) FROM incentives);
       
       
