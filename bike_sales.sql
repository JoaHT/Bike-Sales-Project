
WITH cte as (
SELECT * 
FROM bike_share_yr_0
UNION 
SELECT * 
FROM bike_share_yr_1)

SELECT dteday, season, cte.yr, weekday, rider_type, riders, ROUND(price,2) as price, ROUND(COGS,2) as COGS, 
ROUND(riders*price,2) as revenue,
ROUND(riders*price-COGS,2) as profit
FROM cte
LEFT JOIN cost_table ON cte.yr = cost_table.yr