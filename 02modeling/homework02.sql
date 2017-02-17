--5.14
CREATE TABLE Customer (
	cust# integer,
	cname varchar(30),
	city varchar(20),
	PRIMARY KEY (cust#)
	);
	
CREATE TABLE Order ( --'Order' is a keyword in SQL, but that's the name the book had...
	order# integer,
	cust# integer,
	odate date,
	ord_amt integer, --I think this means the amount of items ordered, but I'm not positive what the book meant.
	PRIMARY KEY (order#),
	--If a customer is deleted, then they obviously can't have any orders associated with them, so we
	--cascade delete.
	FOREIGN KEY (cust#) REFERENCES Customer(cust#) ON DELETE CASCADE,
	CHECK (ord_amt >= 0) --Can't have a negative price
	);
	
CREATE TABLE Order_item (
	item# integer, 
	order# integer,
	qty integer,
	--We want to set this to null so that if the item is deleted, we can let the customer know
	--instead of just losing the record, as the order is presumably still there.
	FOREIGN KEY (item#) REFERENCES Item(item#) ON DELETE SET NULL,
	--If the order is deleted, there is no point in knowing what the ordered item was anymore.
	FOREIGN KEY (order#) REFERENCES Order(order#) ON DELETE CASCADE,
	CHECK (item# > 0), --Positive item number
	CHECK (qty > 0) --Must order at least one item
	);
	
CREATE TABLE Item (
	item# integer,
	name varchar(50),
	unit_price float,
	PRIMARY KEY (item#),
	CHECK (item# > 0), --Positive item number
	CHECK (unit_price > 0), --Can't have a negative price
	);
	
CREATE TABLE Shipment (
	order# integer,
	warehouse# integer,
	ship_date date;
	--Set both of these to null on delete because even if an order or warehouse is deleted, we still want
	--the shipment to be tracked and ensure it arrives.
	FOREIGN KEY (order#) REFERENCES Order(order#) ON DELETE SET NULL,
	FOREIGN KEY (warehouse#) REFERENCES Warehouse(warehouse#) ON DELETE SET NULL,
	);

CREATE TABLE Warehouse (
	warehouse# integer,
	city varchar(20),
	PRIMARY KEY (warehouse#)
	);



INSERT INTO Customer VALUES (1, 'Kyle', 'Ada');
INSERT INTO Customer VALUES (2, 'Matt', 'Frankenmuth');
INSERT INTO Customer VALUES (3, 'Nate', 'Grandville');
INSERT INTO Customer VALUES (4, 'Grant', 'Grandville');

INSERT INTO Order VALUES (1, 1, '02-Feb-2017', 2);
INSERT INTO Order VALUES (2, 1, '03-Feb-2017', 1);
INSERT INTO Order VALUES (3, 3, '10-Feb-2017', 2);
INSERT INTO Order VALUES (4, 2, '11-Feb-2017', 1);

INSERT INTO Order_item VALUES (01667, 1, 1);
INSERT INTO Order_item VALUES (00546, 1, 1);
INSERT INTO Order_item VALUES (76490, 2, 1);
INSERT INTO Order_item VALUES (45843, 3, 2);
INSERT INTO Order_item VALUES (85237, 4, 1);

INSERT INTO Item VALUES (01667, "Basketball Jersey", 40.00);
INSERT INTO Item VALUES (00546, "Mini Basketball", 4.78);
INSERT INTO Item VALUES (76490, "The White Stripes CD", 13.92);
INSERT INTO Item VALUES (45843, "Adidas Wristband", 9.99);
INSERT INTO Item VALUES (85237, "Mini Soccer Ball", 8.99);

INSERT INTO Shipment VALUES (1, 1, '05-Feb-2017');
INSERT INTO Shipment VALUES (2, 1, '07-Feb-2017');
INSERT INTO Shipment VALUES (3, 1, '12-Feb-2017');
INSERT INTO Shipment VALUES (4, 2, null);

INSERT INTO Warehouse VALUES (1, 'Grand Rapids');
INSERT INTO Warehouse VALUES (2, 'Detroit');
INSERT INTO Warehouse VALUES (3, 'Chicago');

--5.20
--One possible way of creating a natural key would be combining values like first name, last name,
--and birth date. However, while it would be highly unlikely, it would still be possible for duplicate keys
--to occur. You could add even more fields, like parts of the student's address or parent's names, but at
--that point it would be, in my opinion, far too tedious and confusing. It would simply require far too many
--fields to be truly unique at the the cost of simplicity and coherence. Because of that, I would say that 
--surrogate keys are acceptable, even if they are not as clear as to what they are referencing.

--SQL Commands:
SELECT odate, ord_amt 
	FROM Order, Customer 
	WHERE Customer.Cname = 'Kyle' 
	ORDER BY odate;
	
SELECT DISTINCT cust# 
	FROM Order;
	
SELECT Customer.cust#, Customer.cname 
	FROM Customer, Order, Order_item, Item 
	WHERE  Item.name = "Mini Basketball" AND Order_item.order# = Order.order#
		AND Order.cust# = Customer.cust# AND Item.item# = Order_item.item#




































