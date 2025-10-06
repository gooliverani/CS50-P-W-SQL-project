SELECT "city", COUNT(*) AS "num_public_schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "num_public_schools" <= 3
ORDER BY "num_public_schools" DESC, "city";
