--Homework 7

--1.
CREATE VIEW Emp AS
	SELECT employee_id, first_name, last_name, email, hire_date, department_name
	FROM Employees JOIN Departments ON Employees.department_id = Department.department_id;
	
--a.
SELECT first_name, last_name, employee_id FROM Emp 
	WHERE department_name = 'Executive' AND hire_date = 
		(SELECT MAX(hire_date) FROM Emp WHERE department_name = 'Executive');

--b.		
UPDATE Emp SET department_name = 'Bean Counting' WHERE department_name = 'Administration';
--Doesn't work:
--Error message: cannot modify a column which maps to a non key-preserved table
--This doesn't work because the department key is not included in the view.


--c.
UPDATE Emp SET first_name = 'Manuel' WHERE first_name = 'Jose Manuel'; --last name?

--d.
INSERT INTO Emp VALUES (12345, 'Kyle', 'Reitsma', 'kr29@students.calvin.edu', '2017-01-18', 'Bean Counting');
--Doesn't work
--Error message: cannot modify more than one base table through a join view
--Since Emp contains more than one table in the view, it can't insert into multiple physical tables. 


--2.
CREATE MATERIALIZED VIEW MEmp AS
	SELECT employee_id, first_name, last_name, email, hire_date, department_name
	FROM Employees JOIN Departments ON Employees.department_id = Department.department_id;
	
--Run same queries as before on MEmp

--a. Works the same

--b. Doesn't work:
-- Error message: data manipulation is not legal on this view
-- Once again, this is because the view is created from a join of two tables

--c. Same error as non-materialized

--d. Same error as non-materialized


--3.

