SELECT "city", COUNT(*) AS "num_public_schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "num_public_schools" DESC, "city"
LIMIT 10;
