	--creating a database

CREATE DATABASE ProjectOne

	--querying data

SELECT * FROM dbo.[2018]
UNION
SELECT * FROM dbo.[2019]
UNION
SELECT * FROM dbo.[2020] 

	--Exploratory Data Analysis (EDA)

With hotels AS (
	SELECT * 
	FROM dbo.[2018]
	UNION
	SELECT *
	FROM dbo.[2019]
	UNION
	SELECT *
	FROM dbo.[2020]
)

SELECT * FROM hotels


SELECT 
	(stays_in_week_nights + 
	stays_in_weekend_nights) * 
	adr AS revenue
FROM hotels


SELECT 
	arrival_date_year,
	ROUND(SUM((stays_in_week_nights + 
	stays_in_weekend_nights) *
	adr), 2) AS revenue
From hotels
GROUP BY arrival_date_year


SELECT
	arrival_date_year,
	hotel,
	ROUND(SUM((stays_in_week_nights +
	stays_in_weekend_nights) *
	adr), 2) AS revenue 
FROM hotels
GROUP BY arrival_date_year, hotel


SELECT 
	arrival_date_year, hotel,
	ROUND(SUM((stays_in_week_nights +
	stays_in_weekend_nights) * 
	adr), 2) AS revenue,
	CONCAT(ROUND((SUM(required_car_parking_spaces)
	/SUM(stays_in_week_nights +
	stays_in_weekend_nights)) *
	100, 2), '%') AS parking_percentage
FROM hotels
GROUP BY arrival_date_year, hotel


SELECT * FROM hotels
LEFT JOIN dbo.market_segment$
ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
ON meal_cost$.meal = hotels.meal