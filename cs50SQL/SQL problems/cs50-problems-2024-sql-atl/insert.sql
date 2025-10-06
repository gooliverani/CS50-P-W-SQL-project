-- Passengers
INSERT INTO "passengers" ("first_name", "last_name", "age")
VALUES ('Amelia', 'Earhart', 39);

-- Airline
INSERT INTO "airlines" ("name", "concourses")
VALUES ('Delta', 'A,B,C,D,T');

-- Flights
INSERT INTO "flights" (
    "flight_number",
    "airline_id",
    "departure_code",
    "arrival_code",
    "expected_departure",
    "expected_arrival"
)
VALUES (
    '300',
    (SELECT "id" FROM "airlines" WHERE name = 'Delta'),
    'ATL',
    'BOS',
    '2023-08-03 18:46',
    '2023-08-03 21:09'
);

-- Check-in
INSERT INTO "check_ins" ("passenger_id", "flight_id", "datetime")
VALUES (
    (SELECT "id" FROM "passengers" WHERE "first_name" = 'Amelia' AND "last_name" = 'Earhart'),
    (SELECT "id" FROM "flights" WHERE "flight_number" = '300'),
    '2023-08-03 15:03'
);
