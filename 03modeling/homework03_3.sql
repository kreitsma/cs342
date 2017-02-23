--9.11
DROP TABLE Employee;
DROP TABLE Customer;
DROP TABLE Mail_Order; --Changed from 'Order' to avoid keyword
DROP TABLE Part;

CREATE TABLE Employee (
	ID integer PRIMARY KEY,
	zipcode integer,
	firstName varchar(20),
	lastName varchar(30),
	CHECK (zipcode >= 0 AND zipcode <= 99999) --5 digit zipcode
	);
	
CREATE TABLE Customer (
	ID integer PRIMARY KEY,
	zipcode integer,
	firstName varchar(20),
	lastName varchar(30),
	CHECK (zipcode >= 0 AND zipcode <= 99999) --5 digit zipcode
	);
	
CREATE TABLE Mail_Order (
	ID integer PRIMARY KEY,
	EmployeeID integer,
	CustomerID integer,
	o_date date,
	exp_s_date date,
	act_s_date date
	FOREIGN KEY (EmployeeID) REFERENCES Employee(ID) ON DELETE CASCADE,
	FOREIGN KEY (CustomerID) REFERENCES Customer(ID) ON DELETE SET NULL
	);
	
CREATE TABLE Part (
	ID integer PRIMARY KEY,
	name varchar(70),
	quant_stock integer,
	price float
	);
	
CREATE TABLE Order_Part (
	Mail_Order_ID integer,
	Part_ID integer,
	quant_ordrd integer,
	FOREIGN KEY (Mail_Order_ID) REFERENCES Mail_Order(ID) ON DELETE SET NULL
	FOREIGN KEY (Part_ID) REFERENCES Part(ID) ON DELETE SET NULL
	);

INSERT INTO Employee VALUES (1, 49301, 'Kyle', 'Reitsma');
INSERT INTO Employee VALUES (2, 49301, 'Randy', 'Reitsma');

INSERT INTO Customer VALUES (1, 49546, 'Grant', 'Hoekwater');
INSERT INTO Customer VALUES (2, 49546, 'Matt', 'Hinds');

INSERT INTO Part VALUES (1, 'USB Cable', 5000, 13.99);
INSERT INTO Part VALUES (2, 'Solid State Drive', 250, 169.99);

INSERT INTO Mail_Order VALUES (1, 1, 2, '14-Feb-2017', '16-Feb-2017', '16-Feb-2017');
INSERT INTO Mail_Order VALUES (2, 2, 1, '18-Feb-2017', '21-Feb-2017', null);

INSERT INTO Order_Part VALUES (1, 1, 2);
INSERT INTO Order_Part VALUES (2, 1, 1);





