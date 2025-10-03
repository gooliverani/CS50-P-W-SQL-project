-- Store critical passwords in a temporary table
CREATE TEMP TABLE "backup" AS
SELECT
    (SELECT "password" FROM "users" WHERE "username" = 'admin') AS "admin_old_pass",
    (SELECT "password" FROM "users" WHERE "username" = 'emily33') AS "emily_pass";

-- Update admin password to MD5 hash of "oops!"
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- Delete the specific audit log entry using a subquery
DELETE FROM "user_logs"
WHERE "id" = (
    SELECT "id" FROM "user_logs"
    WHERE "type" = 'update'
    AND "old_username" = 'admin'
    AND "new_username" = 'admin'
    AND "new_password" = '982c0381c279d139fd221fce974916e7'
    ORDER BY "id" DESC
    LIMIT 1
);

-- Insert fabricated log entry to frame emily33
INSERT INTO "user_logs" (
    "type",
    "old_username",
    "new_username",
    "old_password",
    "new_password"
)
SELECT
    'update',
    'admin',
    'admin',
    "admin_old_pass",
    "emily_pass"
FROM "backup";
