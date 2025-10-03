-- FOREIGN KEY Constraints - reminder, this is when one table uses a primary key from another table. If we delete something that includes a FOREIGN KEY that is being used in another table, we cause a problem.

-- Demonstrates deleting rows with constraints
-- Uses mfa.db

-- Raises a foreign key constraint error
-- if you do this, you get a FOREIGN KEY constraint error.
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';

-- Deletes the artist's affiliation with their work, using hard-coded id
-- in order to get rid of the the artist, we have to remove the blocker which is in created that affiliates the artist with the collection piece. 
DELETE FROM "created" WHERE "artist_id" = 3;

-- Deletes the artist's affiliation with their work, using subquery
-- This is the better way using subquery to get the correct ID. 
DELETE FROM "created" WHERE "artist_id" = (
    SELECT "id" FROM "artists" WHERE "name" = 'Unidentified artist'
);

-- Deletes the artist themselves
-- now that it is removed from created, you can remove the unidentified artist from the artists table. 
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';


-- you can specify an alternative action that happens when you use the below
-- RESTRICT - will not be allowed to do it. 
-- NO ACTION - nothing happens, you would be allowed to do it.
-- SET NULL - if you remove the primary key then the file that utilizes the foreign key will set this to Null.
-- SET DEFAULT -
-- CASCADE - if you delete the primary key, you also delete any affiliations. Turns the two step process into a one step process
FOREIGH KEY ('artist_id') REFERENCES 'artists'('id')
ON DELETE RESTRICT