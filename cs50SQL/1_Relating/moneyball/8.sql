SELECT "salaries"."salary"
FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "performances"."HR" = (
    SELECT MAX("HR")
    FROM "performances"
)
AND "salaries"."year" = 2001;
