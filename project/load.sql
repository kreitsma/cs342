-- Load the Grammys church database. 
-- See ../README.md for details.

-- Drop the previous table declarations.
@&project\drop         
commit;
-- Reload the table declarations.
@&project\schema
commit;
-- Load the table data.
@&project\data
commit;