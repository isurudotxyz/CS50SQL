-- temp table 
CREATE TABLE IF NOT EXISTS "meteorites_temp" (
"name" TEXT NOT NULL,
"id" INTEGER,
"nametype" TEXT NOT NULL,
"class" TEXT NOT NULL,
"mass" DECIMAL DEFAULT NULL,
"discovery" TEXT CHECK ("discovery" IN ('Fell', 'Found')),
"year" YEAR DEFAULT NULL,
"lat" DECIMAL DEFAULT NULL,
"long" DECIMAL DEFAULT NULL,
PRIMARY KEY("id")

);
CREATE TABLE IF NOT EXISTS "meteorites" (
"name" TEXT,
"id" INTEGER,
"class" TEXT,
"mass" REAL,
"discovery" TEXT,
"year" INTEGER,
"lat" DECIMAL,
"long" DECIMAL,
PRIMARY KEY("id")
);

.import --csv --skip 1 meteorites.csv meteorites_temp
UPDATE "meteorites_temp" 
	SET "mass" = NULL  
	WHERE 
	"mass" IS NULL OR "mass" = "";
UPDATE "meteorites_temp" 
	SET "year" = NULL 
	WHERE 
	"year" IS NULL OR "year" = "";
UPDATE "meteorites_temp" 
	SET "lat" = NULL   
	WHERE 
	"lat" IS NULL OR "lat" = "";
UPDATE "meteorites_temp" 
	SET "long" = NULL   
	WHERE 
	"long" IS NULL OR "long" = "";

UPDATE "meteorites_temp"
	SET  "mass" = ROUND("mass",2), "lat" = ROUND("lat",2),"long" = ROUND("long",2);

INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")  SELECT "name","class","mass", "discovery", "year","lat", "long" FROM "meteorites_temp" WHERE "meteorites_temp"."nametype" != 'Relict' ORDER BY "year" ,"name"; 
DROP TABLE "meteorites_temp";