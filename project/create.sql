-- Create the Grammys user and database. 

-- Create the user.
DROP USER project CASCADE;
CREATE USER project 
	IDENTIFIED BY kr29
	QUOTA 5M ON System;
GRANT 
	CONNECT,
	CREATE TABLE,
	CREATE SESSION,
	CREATE SEQUENCE,
	CREATE VIEW,
	CREATE MATERIALIZED VIEW,
	CREATE PROCEDURE,
	CREATE TRIGGER,
	UNLIMITED TABLESPACE
	TO project;

-- Connect to the user's account/schema.
CONNECT project/kr29;

-- Create the database.
DEFINE project=C:\Users\kr29\Documents\cs342\project
@&project\load