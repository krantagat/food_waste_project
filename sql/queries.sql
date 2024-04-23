-- Query 1 |Top 10 countries with the highest average foodwaste in tonnes -- 
SELECT 
country, seriesdescription AS target_name,
ROUND(AVG(value), 0) AS average_value
FROM 12_3_eu
GROUP BY  country, seriesdescription
ORDER BY AVG(value) DESC 
LIMIT 10;

-- Query 2 | Top 5 countries with highest aveage percentage and kilo per capita of food insecurity  --
SELECT 
    per.country, per.year,per.seriesdescription AS target_name,
    ROUND(SUM(per.value) / 3,2) AS average_percentage_value,
    ROUND(SUM(cap.value) / 3,2) AS average_capita_value
FROM 
    moderate_percent AS per
INNER JOIN 
    moderate_population AS cap ON per.id = cap.id 
GROUP BY 
     per.country, per.year, per.seriesdescription
LIMIT 5;
select * from tonne_cap;

-- Query 3 | First the county with highest total food waste in tonnes --
SELECT 
    year,
    country,SUM(food_production) AS food_production,SUM(food_manufacture) AS food_manufacture,
    SUM(food_distribution) AS food_distribution,
    SUM(food_services) AS food_services,
    SUM(total_household_activities) AS food_household,
	SUM(total) AS total
FROM 
    tonne_cap 
GROUP BY 
    year, country
ORDER BY total DESC
LIMIT 1;




-- Query 4 What is the most common national fruit in Europe and from which countries --
SELECT country,
    common_name
FROM
    national_fruit
WHERE
    common_name = (
        SELECT
        common_name as national_fruit
        FROM
            national_fruit
        GROUP BY
            common_name
        ORDER BY
            COUNT(*) DESC
        LIMIT 1);

-- Query 5 Filtering only France from 4 United Nation tables--
SELECT id, indicator, seriesdescription, country, year, value, time_detail, source,footnote, units 
FROM moderate_percent 
WHERE country = 'France'
UNION ALL
SELECT 
   *
FROM moderate_population 
WHERE country = 'France'
UNION ALL
SELECT id, indicator, seriesdescription, country, year, value, time_detail, source, footnote, units 
FROM severe_percent 
WHERE country = 'France'
UNION ALL
SELECT *
FROM severe_population 
WHERE country = 'France';


Select * from top_wasted;
