-- Demonstrates prepared statements

-- Create a prepared statement
-- ? - cleans any data before it comes in so we don't run code we don't want it to run.
PREPARE `balance_check`
FROM 'SELECT * FROM `accounts`
WHERE `id` = ?';

-- Execute the prepared statement with non-malicious input
-- Set a user variable
SET @id = 1;
EXECUTE `balance_check` USING @id;

-- Execute the prepared statement with malicious input
-- Set a user variable
SET @id = '1 UNION SELECT * FROM `accounts`';
EXECUTE `balance_check` USING @id;
