--1. a.
SELECT Employees.first_name, Employees.last_name FROM Employees, Job_History
	WHERE Employees.employee_id = Job_History.employee_id AND Job_History.end_date IS NOT NULL;

--b.
SELECT e.first_name, e.last_name, m.first_name, m.last_name FROM Employees e, Employees m, Job_History jh
	WHERE e.manager_id = m.employee_id AND e.hire_date < m.hire_date AND m.department_id = jh.department_id
	AND e.employee_id = jh.employee_id;
	
--c.
SELECT Country_Name, Department_Name FROM Countries c, Departments d, Locations l WHERE d.location_id = l.location_id
	AND l.country_id = c.country_id;
	
--nested query
SELECT Country_Name FROM Countries c, Locations l WHERE c.country_id = l.location_id AND
	l.location_id IN (SELECT d.location_id FROM Departments d WHERE l.location_id = d.location_id);

--I think the join version is better, because for me it is more readable. Performance-wise, I think Oracle is able to 
--optimize joins well enough that it shouldn't perform significantly worse than the subquery, if at all. 