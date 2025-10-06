-- Find 10 schools with the most students that drpped with the above average expenditures

SELECT "schools"."name" AS "school_name",
    "expenditures"."per_pupil_expenditure",
    "graduation_rates"."dropped"
FROM "districts"
JOIN "schools" ON "districts"."id" = "schools"."district_id"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
WHERE "per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)
ORDER BY "dropped" DESC, "per_pupil_expenditure" DESC, "school_name"
LIMIT 10;
