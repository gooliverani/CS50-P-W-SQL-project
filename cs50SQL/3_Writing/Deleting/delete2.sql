-- Demonstrates deleting rows with ON DELETE actions
-- Uses mfa.db

-- Deletes an artist when foreign key ON DELETE action is set to CASCADE
-- NOTE This did not work. 
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';
