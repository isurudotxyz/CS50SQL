
-- *** The Lost Letter ***
-- information 
--  name anneke
--  address sent to  2 finnegan street 
--  address went from to 900 soemrville avenue  
-- queries 
SELECT "address", "type" FROM "addresses" WHERE "id" = ( SELECT "to_address_id" FROM "packages" WHERE "contents" LIKE 'Congratulatory%' );



-- *** The Devious Delivery ***
SELECT "type" FROM "addresses" WHERE "id" = ( SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL AND "action" = 'Drop'));

SELECT	"contents"FROM	"packages" WHERE "from_address_id" IS NULL;



-- *** The Forgotten Gift ***
-- driver name 
SELECT "name" FROM "drivers" WHERE "id" IN ( SELECT "driver_id" FROM "scans" WHERE "package_id" = ( SELECT "id" FROM "packages" WHERE "from_address_id" = ( SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')) AND "timestamp" = (SELECT MAX("timestamp") FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" = ( SELECT "id" FROM "addresses" WHERE address = '109 Tileston Street'))));

-- package content
SELECT "contents" FROM "packages" WHERE "from_address_id" = ( SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')

