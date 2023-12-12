-- passenger table
-- first name, last name and age 
CREATE TABLE IF NOT EXISTS "passenger" (
	"first_name" TEXT,
	"last_name" TEXT,
	"age" INTEGER
);

-- check-in 
-- exact date and time
-- flight they are check-in for 
CREATE TABLE IF NOT EXISTS "check-in" (
	"date_time" NUMERIC,
	"flight_id" INTEGER,
	FOREIGN KEY("flight_id") REFERENCES "flight"("id")
);

CREATE TABLE IF NOT EXISTS "airline" (
	"airline_name" TEXT,
	"concourse" TEXT
	"id" INTEGER
	-- PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "flights" (
	"id" INTEGER,
	"airline" INTEGER,
	"departure_code" TEXT,
	"arrival_code" TEXT,
	"departure_date" NUMERIC,
	"arrival_date" NUMERIC,
	FOREIGN KEY("airline") REFERENCES "airline"("id")

);

-- airlines 
-- name of airline 
-- concourse

-- flights 
-- flight number 
-- airline operating
-- code airport 
-- arrival airport code
-- expected departure date and time
-- expected arrival date and time

