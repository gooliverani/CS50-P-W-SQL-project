SELECT "teams"."name" AS "name",
    SUM("performances"."H") AS "total_hits"
FROM "performances"
JOIN "teams" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" = 2001
GROUP BY "teams"."id"
ORDER BY "total_hits" DESC
LIMIT 5;
