--Exercise 2.3:

--Yes, you would include this expression in the Casting table when declaring 'status':
CREATE TABLE Casting (
	...
	status ENUM('star', 'costar', 'extra'),
	...
	);
--Then you could get rid of the CHECK. This removes an extra line with the constraint, making it more concise and reducing storage space. 