SELECT "players"."first_name",
    "players"."last_name",
    "salaries"."salary"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001
ORDER BY "salary", "first_name", "player_id"
LIMIT 50;
