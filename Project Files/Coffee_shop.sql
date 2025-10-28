SELECT *
FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA
LIMIT 10;


----Revenue per transaction
SELECT transaction_id,
      transaction_qty*unit_price AS revenue
FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA;

----Total number of sales/transaction made
SELECT COUNT(transaction_id) AS number_of_transactions
FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA;

----Count the different number of shops
SELECT COUNT(DISTINCT store_id) AS number_of_shops
FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA;
---Show the different name shops
SELECT DISTINCT store_location,
                store_id
FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA;

----Revenue by store location
SELECT store_location,
      SUM(transaction_qty*unit_price) AS revenue
FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA
GROUP BY store_location;

----Opening time for the shop
SELECT MIN(transaction_time) AS Opening_time
FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA;

----Closing time for the shop
SELECT MAX(transaction_time) AS Closing_time
FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA;
-------------------------------------------------------------------------------------------------------------------------------

SELECT transaction_time,
CASE
WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN '01.Morning'
WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN '02.Afternoon'
WHEN transaction_time BETWEEN '16:00:00' AND '19:59:59' THEN '03.Evening'
WHEN transaction_time >= '20:00:00' THEN '04.Night'
      END AS time_bucket,
HOUR(transaction_time) AS hour_of_day,

transaction_date,
DAYNAME(transaction_date) AS day_name,
CASE
WHEN day_name IN ('Sun','Sat') THEN 'Weekend'
ELSE 'Weekday'
END AS day_classification,
MONTHNAME(transaction_date) AS month_name,

----Categorical data
store_location,
product_category,
product_type,
product_detail,

------ID'S
COUNT(DISTINCT store_id) AS number_of_shops,
COUNT(DISTINCT store_id) AS number_of_sales,

-----Quantative data
SUM(transaction_qty*unit_price) AS Revenue,

FROM BRIGHT.LEARNDATA.BRIGHT_LEARN_DATA
GROUP BY ALL;
