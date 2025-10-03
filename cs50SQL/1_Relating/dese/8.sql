SELECT "districts"."name" AS "district_name",
    "expenditures"."pupils" AS "num_of_pupils"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
ORDER BY "pupils" DESC, "name";
