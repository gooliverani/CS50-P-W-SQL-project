
-- *** The Lost Letter ***
-- Find Anneke's lost letter by tracking the package from her address to Varsha's (with possible misspelling) and check delivery scan
SELECT "packages"."contents" AS "package_content", -- To check if it's correct package content (just to make sure)
    "addresses"."address" AS "to_address",         -- To check address where package was actualy sent
    "addresses"."type" AS "to_address_type",       -- To check reciving address type
    "scans"."action", "timestamp"                  -- To check if package is delivered and when
FROM "packages"
JOIN "scans" ON "packages"."id" = "scans"."package_id"       -- To find package id trough scans
JOIN "addresses" ON "scans"."address_id" = "addresses"."id"  -- To find address where package ended up...
WHERE "packages"."from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'  -- Finding Anneke's addresse id
    )
AND "packages"."to_address_id" IN (
    SELECT "id" FROM "addresses"
    WHERE "address" LIKE '%Finn%'              -- Finding Varsha's addresse id and possible misspeling
    )
AND "scans"."action" = 'Drop';                 -- Finding if package has been droped at the to_address


-- *** The Devious Delivery ***
-- Find address where delivery ended up without sending address and knowing that in a package is something that "quack"
SELECT "packages"."id" AS "package_id",          -- To check if there is some other package with the same content name
    "packages"."contents" AS "package_content",  -- To check content name
    "addresses"."address" AS "to_address",       -- To check where package ended up
    "addresses"."type" AS "to_address_type",     -- To check type of reciving address
    "scans"."action", "timestamp"                -- To check when was the last time package droped or picked
FROM "packages"
JOIN "scans" ON "packages"."id" = "scans"."package_id"      -- To find package id trough scans
JOIN "addresses" ON "scans"."address_id" = "addresses"."id" -- To find reciving address id...
WHERE "packages"."from_address_id" IS NULL                  -- ...knowing that is no from address
AND "packages"."contents" LIKE '%duck%';                    -- ...and probably duck in content name because "quack" in explanation
 -- It's a Duck debugger that was first at Residential address than droped to Police Station

-- *** The Forgotten Gift ***
-- Find forgotten gift content and where is it. Also, who has the package
SELECT "packages"."id" AS "package_id",
    "packages"."contents" AS "package_content",  -- To check the content of the gift
    "addresses"."address" AS "to_address",       -- To check address of the last action regarding gift
    "addresses"."type" AS "to_address_type",     -- To check type of the to_address
    "scans"."action", "timestamp",               -- To check when was the last time package droped or picked
    "drivers"."name" AS "driver_name"            -- To check who has the package if the last action was "Pick"
FROM "packages"
JOIN "scans" ON "packages"."id" = "scans"."package_id"       -- To find package id trough scans
JOIN "addresses" ON "scans"."address_id" = "addresses"."id"  -- To find reciving address id
JOIN "drivers" ON "scans"."driver_id" = "drivers"."id"       -- To find driver id
WHERE "packages"."from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
    )
AND "packages"."to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'                      -- ...knowing both addresses
)
ORDER BY "timestamp" DESC;                                   -- To put last action on the top
