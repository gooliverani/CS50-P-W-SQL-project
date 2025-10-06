-- Create database and switch to it
CREATE DATABASE IF NOT EXISTS `linkedin`;
USE `linkedin`;

-- Drop tables in reverse order of dependency
DROP TABLE IF EXISTS `experiences`;
DROP TABLE IF EXISTS `educations`;
DROP TABLE IF EXISTS `connections`;
DROP TABLE IF EXISTS `companies`;
DROP TABLE IF EXISTS `schools`;
DROP TABLE IF EXISTS `users`;

-- Create tables
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `founded_year` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections` (
    `user1_id` INT,
    `user2_id` INT,
    PRIMARY KEY(`user1_id`, `user2_id`),
    FOREIGN KEY(`user1_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY(`user2_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    CHECK(`user1_id` != `user2_id`)
);

CREATE TABLE `educations` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree_type` VARCHAR(10),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`) ON DELETE CASCADE
);

CREATE TABLE `experiences` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO `users` (`first_name`, `last_name`, `username`, `password`)
VALUES
  ('Claudine', 'Gay', 'claudine', 'password'),
  ('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO `schools` (`name`, `type`, `location`, `founded_year`)
VALUES ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

INSERT INTO `companies` (`name`, `industry`, `location`)
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO `educations` (`user_id`, `school_id`, `start_date`, `end_date`, `degree_type`)
SELECT
  (SELECT `id` FROM `users` WHERE `username` = 'claudine'),
  (SELECT `id` FROM `schools` WHERE `name` = 'Harvard University'),
  '1993-01-01',
  '1998-12-31',
  'PhD';

INSERT INTO `experiences` (`user_id`, `company_id`, `start_date`, `end_date`, `title`)
SELECT
  (SELECT `id` FROM `users` WHERE `username` = 'reid'),
  (SELECT `id` FROM `companies` WHERE `name` = 'LinkedIn'),
  '2003-01-01',
  '2007-02-01',
  'CEO and Chairman';
