CREATE VIEW `average_country` AS

SELECT country_id,country, seriesdescription, AVG(value) AS average_value
FROM 12_3_eu
GROUP BY country_id,country, seriesdescription;