CREATE VIEW "june_vacancies" AS
SELECT
    "listings"."id" AS "id",
    "property_type",
    "host_name",
    COUNT("availabilities"."date") AS "days_vacant"
FROM "listings"
LEFT JOIN "availabilities"
    ON "listings"."id" = "availabilities"."listing_id"
    AND "availabilities"."available" = TRUE
    AND "availabilities"."date" BETWEEN '2023-06-01' AND '2023-06-30'
GROUP BY "listings"."id";
