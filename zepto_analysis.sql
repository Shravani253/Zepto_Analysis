drop table if exists zepto;
CREATE TABLE zepto
(
sku_id SERIAL PRIMARY KEY,
category VARCHAR (120),
name VARCHAR (150) NOT NULL,
mrp NUMERIC (8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC (8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--data exploration
-- count of rows 
SELECT COUNT (*) FROM zepto;

--sample data 
SELECT *  FROM zepto
LIMIT 10;

--null values
SELECT * FROM zepto
WHERE name is NULL
OR 
category is NULL
OR 
mrp is NULL
OR 
discountPercent is NULL
OR 
discountedSellingPrice is NULL
OR 
availableQuantity is NULL
OR 
outOfStock is NULL
OR 
quantity is NULL
OR 
weightInGms is NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs product out of stock
SELECT outOfStock, COUNT (sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present multiple times
SELECT name, COUNT (sku_id) as "Nunmber of Skus"
FROM zepto
GROUP BY name
HAVING count (sku_id) > 1
ORDER BY count(sku_id) DESC;

--data cleaning
--product with price = 0

SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice=0;

DELETE FROM zepto 
WHERE mrp = 0;

--convert paise into rupees
UPDATE zepto 
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedSellingPrice FROM zepto 


 -- Find the top 10 best value products based on the discount percentage?
 SELECT DISTINCT name, mrp, discountPercent
 FROM zepto
 ORDER BY discountPercent DESC
 LIMIT 10;

 -- What are the products with high mrp but out of stock ?
 SELECT DISTINCT name, mrp 
 FROM zepto
 WHERE outOfStock = TRUE and mrp > 300
 ORDER BY mrp DESC;

 --calculate estimated revenue for each category 
 SELECT category, 
 SUM(discountedSellingPrice * availableQuantity) AS total_revenue
 FROM zepto
 GROUP BY category
 ORDER BY total_revenue DESC;

 --find all products where mrp is greater than 500 and discount is less than 10%
 SELECT DISTINCT name, mrp, discountPercent
 FROM zepto
 WHERE mrp > 500 and discountPercent < 10
 ORDER BY mrp DESC, discountPercent DESC;

 --identify the top 5 categories offering the heighest average discount percent?
 SELECT category,
 ROUND(AVG(discountPercent),2) AS avg_discount
 FROM zepto
 GROUP BY category
 ORDER BY avg_discount DESC
 LIMIT 5;

 --Find the price per gms for products above 100g and sort by best value 
 SELECT name, weightInGms, discountedSellingPrice,
 discountedSellingPrice/weightInGms AS price_per_gms
 FROM zepto 
 WHERE weightinGms >=100 
 ORDER BY price_per_gms DESC
 LIMIT 10;

 --Group the product into categories ike low, medium, bulk
 SELECT DISTINCT name, weightInGms,
 CASE WHEN weightInGms < 1000 THEN 'Low'
	 WHEN weightInGms < 5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;

--what is the Total Inventory Weight per category
 SELECT category,
 SUM (weightInGms * availableQuantity) AS total_weight
 FROM zepto 
 GROUP BY category
 ORDER BY total_weight;
 
 
 