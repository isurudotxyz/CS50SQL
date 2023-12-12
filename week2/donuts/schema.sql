-- ingredients 
-- name 
-- price per pound 
CREATE TABLE IF NOT EXISTS "ingredients" (
	"id" INTEGER,
	"name" TEXT,
	"price_per_pound" DECIMAL(10,2),
	PRIMARY KEY ("id")
);

-- donuts 
-- name of the donut
-- if it's gluten free 
-- price per donut 

CREATE TABLE IF NOT EXISTS "donuts" (
	"id" INTEGER,
	"name" TEXT,
	"gluten-free" TEXT,
	"ingredient_id" INTEGER,
	"price" DECIMAL(10,2),
	PRIMARY KEY ("id"),
	FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);



-- orders 
-- order number 
-- all donuts in the order
-- customer who placed the order 
CREATE TABLE IF NOT EXISTS "orders" (
	"id" INTEGER,
	"order_number" NUMERIC,
	"donuts" TEXT,
	"customer_id" INTEGER,
	"donut_id" INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY ("customer_id") REFERENCES "customer"("id")
);

-- customers 
-- fist and last name 
-- history of theirs order 
CREATE TABLE IF NOT EXISTS "customer" (
	"id" INTEGER,
	"name" TEXT,
	"order_history" INTEGER,
	PRIMARY KEY ("id"),
	FOREIGN KEY ("order_history") REFERENCES "orders"("id")
);