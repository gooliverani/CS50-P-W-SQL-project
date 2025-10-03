-- Part 4 - 

-- Stored procedure - call to find all the items marked as not deleted

-- CREATE PROCEDURE <name>
-- BEGIN
-- statements to run
-- END;

-- CALL <name> - calls the procedure when needed to run.

-- Demonstrates stored procedures
-- Uses `mfa` database

-- Sets up database
-- do this once the database has been set up from the schema.
USE `mfa`;

-- Adds deleted column to columns
ALTER TABLE `collections` 
ADD COLUMN `deleted` TINYINT DEFAULT 0;

-- Creates a stored procedure to view all (non-deleted) items in collections
-- delimter // - happens first because the semi-colon in the select statement may prematurally cause the procedure to end. So we use a different kind of notation to mark the end. In this case // when we want to go back to a semi-colon marking the end we have to call delimiter ; to mark we are back to ; ending statements instead of //

delimiter //
CREATE PROCEDURE `current_collections`()
BEGIN
SELECT `title`, `accession_number`, `acquired` FROM `collections` WHERE `deleted` = 0;
END//
delimiter ;

-- Calls the stored procedure
CALL `current_collections`();

-- Sets an item to be deleted
UPDATE `collections` SET `deleted` = 1 
WHERE `title` = 'Farmers working at dawn';

-- Calls stored procedure again
CALL `current_collections`();

-- Creates a table to log artwork transactions
CREATE TABLE `transactions` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(64) NOT NULL,
    `action` ENUM('bought', 'sold') NOT NULL,
    PRIMARY KEY(`id`)
);

-- Creates a stored procedure with a parameter to mark artwork sold
-- adding input to the function. Here we are using the id of the artwork being sold. 
-- IN - input and then include the type

delimiter //
CREATE PROCEDURE `sell`(IN `sold_id` INT)
BEGIN
UPDATE `collections` SET `deleted` = 1 WHERE `id` = `sold_id`;
INSERT INTO `transactions` (`title`, `action`)
VALUES ((SELECT `title` FROM `collections` WHERE `id` = `sold_id`), 'sold');
END//
delimiter ;

-- Sells a piece of artwork
CALL `sell`((
    SELECT `id` FROM `collections`
    WHERE `title` = 'Farmers working at dawn'
));

-- Shows results
SELECT * FROM `transactions`;
SELECT * FROM `collections`;

-- Delete procecure to later improve it
DROP PROCEDURE `sell`;

-- Creates a stored procedure to handle case where item is already deleted
delimiter //
CREATE PROCEDURE `sell`(IN `sold_id` INT)
BEGIN
IF `sold_id` IN (
    SELECT `id` FROM `collections` WHERE `deleted` = 0
) THEN
    UPDATE `collections` SET `deleted` = 1 WHERE `id` = `sold_id`;
    INSERT INTO `transactions` (`title`, `action`)
    VALUES ((SELECT `title` FROM `collections` WHERE `id` = `sold_id`), 'sold');
END IF;
END//
delimiter ;


-- Procedures... - can use condtionals and loops as well.