SELECT "name" AS "district_name"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "district_name" NOT LIKE '%(non-op)'
AND "pupils" = (
    SELECT MIN("pupils") FROM "expenditures"
);
