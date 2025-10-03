-- #8ba1a5 / RGB: 139, 161, 165
-- #b3b399 / RGB: 179, 179, 153
-- #a6a799 / RGB: 166, 167, 153

SELECT "average_color" FROM "views"
WHERE "artist" = 'Hokusai'
AND "english_title" LIKE '%river%';



