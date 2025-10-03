-- PART 1 after login.sql

-- THIS IS JUST FOR MYSQL

-- Demonstrates types in MySQL and schema for `mbta` database

-- Creates and uses `mbta` database
-- notice that backticks are used to create the database
CREATE DATABASE IF NOT EXISTS `mbta`;
-- if you want to run your future qureies on this database you use the following code
 USE `mbta`;

-- Creates tables with MySQL types
-- have a lot more control and variety with MySQL
-- DATA TYPES for INTEGERS - TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
-- TINY INT - -128 to 127
-- SMALL INT - -32,768 to 32,767
-- MEDIUM INT - -8,388,608 to 8,388,607
-- INT - -2,147,483,648 to 3,147,483,647
-- BIG INT - -2 to the 63rd power to 2 to the 63rd power -1

-- unsigned integer has no negative numbers only positive so could actually go higher because we aren't using the negatives so TINY INT goes up to 255 etc..


-- same here, there are backticks and them we remove INTEGER and change to just INT
-- AUTO_INCREMENT - sqlite did it for us, in MySQL you have to include this to make sure it increments.
CREATE TABLE `cards` (
    `id` INT AUTO_INCREMENT,
    PRIMARY KEY(`id`)
);

-- shows the tables we have.
SHOW TABLES;

-- gives us more info about the table itself. 
DESCRIBE `cards`;

-- Strings - CHAR and VARCHAR
-- CHAR(NUM) - fixed width string, a string that only has and will ever have the same number of characters 
-- VARCHAR(NUM) - when you don't know how long a string will be up to some number of characters. 
-- TEXT - for longer chunks of text like paragraphs, or pages of text.
    -- TINYTEXT
    -- TEXT
    -- MEDIUMTEXT
    -- LONGTEXT

-- BLOB - still stores binary
-- ENUM - fixed range of values only have one of these options
-- SET - Allows you to choose more than one in a same cell. Fixed range of values but allows you to choose multi.

CREATE TABLE `stations` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `line` ENUM('blue', 'green', 'orange', 'red') NOT NULL,
    PRIMARY KEY(`id`)
);

DESCRIBE `stations`;


-- DATES - 
    -- DATE - just the date year, month, day
    -- TIME(fsp) - just the time hours minutes seconds can specify how many decimal digits want to keep track. 
    -- DATETIME(fsp) - combines date and time can specify how many decimal digits want to keep track. 
    -- TIMESTAMP(fsp) - more precision for logging events can specify how many decimal digits want to keep track. 
    -- YEAR - just the year.

-- REAL Numbers - we use REAL in SQLite
    -- FLOAT - stores a number in 4 bytes
    -- DOUBLE PRECISION - stores a number in 8 bytes

-- Fixed Precision - you can specify that you always want to have two places after the decimal precisely represented.
    -- DECIMAL(M,D) - Store a certain number of digits with some number coming after the decimal point. 
        -- ex DECIMAL(5, 2) - would be anything between -999.99 and 999.99.

-- floating point imprecision - the more accurate you need the data you would need to use more precision. Floats are less precise. DOUBLE PRECISION still isn't precise but much better. Fixed Precision DECIMAL helps even more with this.

CREATE TABLE `swipes` (
    `id` INT AUTO_INCREMENT,
    `card_id` INT,
    `station_id` INT,
    `type` ENUM('enter', 'exit', 'deposit') NOT NULL,
    `datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `amount` DECIMAL(5,2) NOT NULL CHECK(`amount` != 0),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`station_id`) REFERENCES `stations`(`id`),
    FOREIGN KEY(`card_id`) REFERENCES `cards`(`id`)
);

DESCRIBE `swipes`;

-- Shows all tables in `mbta` database
SHOW TABLES;
