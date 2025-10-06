-- Insert ingredients
INSERT INTO "ingredients" ("name", "price_per_unit", "unit")
VALUES
    ('Cocoa', 5.00, 'pound'),
    ('Sugar', 2.00, 'pound'),
    ('Flour', 1.50, 'pound'),       -- Sample flour price
    ('Buttermilk', 3.00, 'gallon'), -- Sample buttermilk price
    ('Sprinkles', 4.00, 'pound');   -- Sample sprinkles price

-- Insert donuts
INSERT INTO "donuts" ("name", "is_glutten_free", "price_per_donut")
VALUES
    ('Belgian Dark Chocolate', 0, 4.00),
    ('Back-To-School Sprinkles', 0, 4.00);

-- Associate ingredients with Belgian Dark Chocolate donut
INSERT INTO "donut_ingredients" ("donut_id", "ingredient_id")
VALUES
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
        (SELECT "id" FROM "ingredients" WHERE "name" = 'Cocoa')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
        (SELECT "id" FROM "ingredients" WHERE "name" = 'Flour')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
        (SELECT "id" FROM "ingredients" WHERE "name" = 'Buttermilk')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
        (SELECT "id" FROM "ingredients" WHERE "name" = 'Sugar'));

-- Associate ingredients with Back-To-School Sprinkles donut
INSERT INTO "donut_ingredients" ("donut_id", "ingredient_id")
VALUES
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
        (SELECT "id" FROM "ingredients" WHERE "name" = 'Flour')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
        (SELECT "id" FROM "ingredients" WHERE "name" = 'Buttermilk')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
        (SELECT "id" FROM "ingredients" WHERE "name" = 'Sugar')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
        (SELECT "id" FROM "ingredients" WHERE "name" = 'Sprinkles'));

-- Insert customer Luis Singh
INSERT INTO "customers" ("first_name", "last_name")
VALUES ('Luis', 'Singh');

-- Create order for Luis Singh (Order ID 1)
INSERT INTO "orders" ("id", "customer_id")
VALUES (
    1, (SELECT "id" FROM "customers"
    WHERE "first_name" = 'Luis'
    AND "last_name" = 'Singh')
);

-- Add order details: 3 Belgian Dark Chocolate and 2 Back-To-School Sprinkles
INSERT INTO "order_details" ("order_id", "donut_id", "quantity")
VALUES
    (1, (SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'), 3),
    (1, (SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'), 2);
