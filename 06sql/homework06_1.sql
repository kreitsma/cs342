--Homework 6
--a.
SELECT TOP 10 m.employee_id, m.first_name, m.last_name, COUNT(e.employee_id) AS numEmployees
	FROM Employees e, Employees m, Departments d 
	WHERE d.manager_id = m.employee_id AND e.employee_id <> m.employee_id
	ORDER BY numEmployees DESC;

--b.
SELECT d.department_name, COUNT(e.employee_id) AS totalEmployees, SUM(e.salary) AS totalSalary
	FROM Department d, Employees e, Locations l, Countries c
	WHERE l.department_id = d.department_id AND l.country_id = c.country_id 
	AND c.country_name <> 'United States of America'
	AND e.department_id = d.department_id
	GROUP BY d.department_name
	HAVING COUNT(*) < 100;
	
--c.
SELECT d.department_name, m.first_name, m.last_name
	FROM Departments d LEFT OUTER JOIN Employees m
	ON d.manager_id = m.employee_id
	JOIN Jobs j
	ON m.job_id = j.job_id;
	
--d.
SELECT d.department_name, AVG(e.salary)
	FROM Departments d LEFT OUTER JOIN Employees e
	ON d.department_id = e.department_id
	GROUP BY d.department_name
	ORDER BY AVG(e.salary) DESC;
 