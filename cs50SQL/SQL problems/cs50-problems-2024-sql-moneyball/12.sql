SELECT "first_name", "last_name"
FROM (
    SELECT "players"."id",
        "players"."first_name",
        "players"."last_name",
        "salaries"."salary" / "performances"."H" AS "dollars_per_hit"
    FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
        AND "salaries"."year" = "performances"."year"
        AND "salaries"."team_id" = "performances"."team_id"
    WHERE "salaries"."year" = 2001
        AND "performances"."H" > 0
    ORDER BY "dollars_per_hit"
    LIMIT 10
) AS "hits_value"

INTERSECT

SELECT "first_name", "last_name"
FROM (
    SELECT "players"."id",
        "players"."first_name",
        "players"."last_name",
        "salaries"."salary" / "performances"."RBI" AS "dollars_per_rbi"
    FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
        AND "salaries"."year" = "performances"."year"
        AND "salaries"."team_id" = "performances"."team_id"
    WHERE
        "salaries"."year" = 2001
        AND "performances"."RBI" > 0
    ORDER BY "dollars_per_rbi" ASC
    LIMIT 10
) AS "rbis_value"

ORDER BY "last_name", "first_name";
