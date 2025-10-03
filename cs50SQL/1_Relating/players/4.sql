SELECT "first_name", "last_name"
FROM "players"
WHERE "birth_country" != 'United States'
OR "birth_country" IS NULL
ORDER BY "first_name", "last_name";
