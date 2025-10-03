-- PART 2 from this folder
-- Root user has to grant permissions to someone so they can see the databases. Note that in this way you can also hide columns of PII and give them access to views 

-- Demonstrates granting and revoking privileges

-- As Carter, try show databases
SHOW DATABASES;

-- As root, grant SELECT privileges on only the analysis view in rideshare
GRANT SELECT ON `rideshare`.`analysis` TO 'carter';

-- As Carter, try showing databases
SHOW DATABASES;
USE `rideshare`;
SELECT * FROM `analysis`;

-- As Carter, cannot view rides table
SELECT * FROM `rides`;

-- As Carter, try to create a new view
CREATE VIEW `destinations` AS
SELECT `destination` FROM `analysis`;

-- As root, grant create view privileges
GRANT CREATE VIEW ON `rideshare`.* TO 'carter';

-- Succeed in creating a view
CREATE VIEW `destinations` AS
SELECT `destination` FROM `analysis`;
