SELECT
     strftime('%Y', air_date) AS "year",
     strftime('%m-%d', MIN(air_date)) AS "earliest_month_day"
FROM "episodes"
WHERE "air_date" IS NOT NULL
GROUP BY "year"
ORDER BY "year";
