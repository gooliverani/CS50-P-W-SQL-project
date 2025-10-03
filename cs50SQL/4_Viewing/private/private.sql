CREATE VIEW "message" AS
WITH "triplets" ("id", "sentence_id", "start_char", "lenght") AS (
    VALUES
        (1, 14, 98, 4),
        (2, 114, 3, 5),
        (3, 618, 72, 9),
        (4, 630, 7, 3),
        (5, 932, 12, 5),
        (6, 2230, 50, 7),
        (7, 2346, 44, 10),
        (8, 3041, 14, 5)
)
SELECT substr("sentences"."sentence", "triplets"."start_char", "triplets"."lenght")
AS "phrase"
FROM "triplets"
JOIN "sentences" ON "triplets"."sentence_id" = "sentences"."id"
ORDER BY "triplets"."id";
