SELECT "artist", "english_title" AS "title", "print_number" AS "print"
FROM "views"
WHERE "contrast" BETWEEN '0.6' AND '0.9'
ORDER BY "print" DESC;
