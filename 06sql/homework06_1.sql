--Homework 6
--a.
SELECT TOP 10 m.employee_id, m.first_name, m.last_name, COUNT(e.employee_id) AS numEmployees
	FROM Employees e, Employees m, Departments d 
	WHERE d.manager_id = m.employee_id AND e.employee_id <> m.employee_id
	ORDER BY numEmployees DESC;

--b.
SELECT d.department_name, COUNT(e.employee_id) AS totalEmployees, SUM(e.salary) AS totalSalary
	FROM Department d, Employees e, Locations l, Countries c
	WHERE e.department_id = d.department_id AND 
 