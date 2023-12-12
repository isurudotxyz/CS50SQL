-- users 
-- first and last name
-- username 
-- password

CREATE TABLE IF NOT EXISTS
 "users"(
	"id" INTEGER,
	"full_name" TEXT,
	"username" TEXT,
	"password" TEXT,
	PRIMARY KEY("id")
);



-- schools and universities 
-- name of the school 
-- type of school 
-- school location
-- foundation year

CREATE TABLE IF NOT EXISTS
 	"school"(
	"id" SERIAL INTEGER,
	"name" TEXT,
	"type" TEXT,
	"location" TEXT,
	"foundation_year" NUMERIC,
	PRIMARY KEY("id")

);
-- companies 
-- company name
-- company industry 
-- company location 

CREATE TABLE IF NOT EXISTS
 	"companies"(
	"id" SERIAL INTEGER,
	"name" TEXT,
	"industry" TEXT,
	"location" TEXT,
	PRIMARY KEY("id")

);

CREATE TABLE IF NOT EXISTS
"people_connection"(
	"id" INTEGER,
	"user_one_id" INTEGER,
	"user_two_id" INTEGER,
	PRIMARY KEY ("id"),
	FOREIGN KEY ("user_one_id") REFERENCES "users"("id"),
	FOREIGN KEY ("user_two_id") REFERENCES "users"("id")
);

CREATE TABLE IF NOT EXISTS
"school_connection" (
	"school_id" INTEGER,
	"user_id" INTEGER,
	"start_affiliation" DATE,
	"end_affiliation" DATE,
	"type" TEXT,
	FOREIGN KEY ("school_id") REFERENCES "school"("id"),
	FOREIGN KEY ("user_id") REFERENCES "user"("id")
);

CREATE TABLE IF NOT EXISTS
"company_connection" (
	"company_id" INTEGER,
	"user_id" INTEGER,
	"start_affiliation" DATE,
	"end_affiliation" DATE,
	"title" TEXT,
	FOREIGN KEY ("company_id") REFERENCES "company"("id"),
	FOREIGN KEY ("user_id") REFERENCES "user"("id")
);


-- connection 
-- people
-- schools 
-- companies 