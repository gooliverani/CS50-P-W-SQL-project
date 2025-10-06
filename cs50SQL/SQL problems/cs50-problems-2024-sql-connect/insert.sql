-- Add users
INSERT INTO "users" ("first_name", "last_name", "username", "password")
VALUES ('Alan', 'Garber', 'alan', 'password'),
       ('Reid', 'Hoffman', 'reid', 'password');

-- Add Harvard University
INSERT INTO "schools" ("name", "type", "location", "founded_year")
VALUES ('Harvard University', 'University', 'Cambridge, Massachusetts', 1636);

-- Add LinkedIn
INSERT INTO "companies" ("name", "industry", "location")
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

-- Add Alan's education
INSERT INTO "educations" ("user_id", "school_id", "start_date", "end_date", "degree_type")
VALUES (
    (SELECT "id" FROM "users" WHERE "username" = 'alan'),
    (SELECT "id" FROM "schools" WHERE "name" = 'Harvard University'),
    '1973-09-01',
    '1976-06-01',
    'BA'
);

-- Add Reid's experience
INSERT INTO "experiences" ("user_id", "company_id", "start_date", "end_date", "title")
VALUES (
    (SELECT "id" FROM "users" WHERE "username" = 'reid'),
    (SELECT "id" FROM "companies" WHERE "name" = 'LinkedIn'),
    '2003-01-01',
    '2007-02-01',
    'CEO and Chairman'
);
