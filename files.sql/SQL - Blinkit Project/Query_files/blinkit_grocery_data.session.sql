SELECT * FROM blinkit_grocery_data;


SELECT
COUNT(*)
FROM blinkit_grocery_data;


UPDATE blinkit_grocery_data
SET item_fat_content =
CASE 
   WHEN item_fat_content IN ('LF','low fat') THEN 'Low Fat' 
   WHEN item_fat_content = 'reg' THEN 'Regular'
   ELSE  item_fat_content
END;

SELECT DISTINCT (item_fat_content)
FROM blinkit_grocery_data;

SELECT * 
FROM blinkit_grocery_data;

SELECT 
sum (total_sales)
FROM blinkit_grocery_data;

SELECT 
  CAST(SUM(total_sales)/1000000 AS DECIMAL(10,1)) AS total_sales_million
FROM blinkit_grocery_data;

SELECT 
  AVG(total_sales) AS avg_total_sales
FROM blinkit_grocery_data;

SELECT 
  CAST(SUM(total_sales)/1000000 AS DECIMAL(10,1)) AS total_sales_million
FROM blinkit_grocery_data
WHERE item_fat_content = 'Low Fat';

SELECT 
  CAST(SUM(total_sales)/1000000 AS DECIMAL(10,1)) AS total_sales_million
FROM blinkit_grocery_data
WHERE item_fat_content = 'Low Fat'
  AND outlet_establishment_year = 2022;

SELECT 
  AVG(total_sales) AS avg_total_sales
FROM blinkit_grocery_data
WHERE outlet_establishment_year = 2022;

SELECT 
  COUNT(*) AS no_of_item
FROM blinkit_grocery_data
WHERE outlet_establishment_year = 2022;

-- Total sales for each outlet type
SELECT 
  outlet_type, 
  SUM(total_sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY outlet_type;

-- Count of unique items by item type
SELECT 
  item_type, 
  COUNT(DISTINCT item_identifier) AS unique_items
FROM blinkit_grocery_data
GROUP BY item_type;

-- Average sales per item fat content
SELECT 
  item_fat_content, 
  AVG(total_sales) AS avg_sales
FROM blinkit_grocery_data
GROUP BY item_fat_content;

-- Top 5 items with the highest total sales
SELECT 
  item_identifier, 
  item_type, 
  total_sales
FROM blinkit_grocery_data
ORDER BY total_sales DESC
LIMIT 5;

-- Total sales and average sales by year
SELECT 
  outlet_establishment_year, 
  SUM(total_sales) AS total_sales, 
  AVG(total_sales) AS avg_sales
FROM blinkit_grocery_data
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year;

-- Number of items per outlet type
SELECT 
  outlet_type, 
  COUNT(*) AS no_of_items
FROM blinkit_grocery_data
GROUP BY outlet_type
ORDER BY no_of_items DESC;

-- Minimum and maximum sales per item type
SELECT 
  item_type, 
  MIN(total_sales) AS min_sales, 
  MAX(total_sales) AS max_sales
FROM blinkit_grocery_data
GROUP BY item_type;

-- Average sales by outlet location type
SELECT 
  outlet_location_type, 
  AVG(total_sales) AS avg_sales
FROM blinkit_grocery_data
GROUP BY outlet_location_type;

-- Number of items by outlet size
SELECT 
  outlet_size, 
  COUNT(*) AS no_of_items
FROM blinkit_grocery_data
GROUP BY outlet_size;

-- Total sales by item fat content and outlet type
SELECT 
  item_fat_content, 
  outlet_type, 
  SUM(total_sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY item_fat_content, outlet_type;

-- Top 3 outlet types by average sales
SELECT 
  outlet_type, 
  AVG(total_sales) AS avg_sales
FROM blinkit_grocery_data
GROUP BY outlet_type
ORDER BY avg_sales DESC
LIMIT 3;

-- Number of outlets by establishment year
SELECT 
  outlet_establishment_year, 
  COUNT(DISTINCT outlet_identifier) AS no_of_outlets
FROM blinkit_grocery_data
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year;

-- Average sales per item type for each outlet type
SELECT 
  outlet_type, 
  item_type, 
  AVG(total_sales) AS avg_sales
FROM blinkit_grocery_data
GROUP BY outlet_type, item_type;

-- Total sales by item type and outlet size
SELECT 
  item_type, 
  outlet_size, 
  SUM(total_sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY item_type, outlet_size;

-- Top 5 outlet identifiers by total sales
SELECT 
  outlet_identifier, 
  SUM(total_sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY outlet_identifier
ORDER BY total_sales DESC
LIMIT 5;

-- Number of items by item fat content and outlet location type
SELECT 
  item_fat_content, 
  outlet_location_type, 
  COUNT(*) AS no_of_items
FROM blinkit_grocery_data
GROUP BY item_fat_content, outlet_location_type;

-- Top 5 item types by total sales
SELECT 
  item_type, 
  SUM(total_sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY item_type
ORDER BY total_sales DESC;

-- Pivot: Total sales for each Outlet_Location_Type split by Item_Fat_Content
SELECT
  Outlet_Location_Type,
  SUM(CASE WHEN Item_Fat_Content = 'Low Fat' THEN Total_Sales ELSE 0 END) AS Low_Fat,
  SUM(CASE WHEN Item_Fat_Content = 'Regular' THEN Total_Sales ELSE 0 END) AS Regular
FROM blinkit_grocery_data
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type;