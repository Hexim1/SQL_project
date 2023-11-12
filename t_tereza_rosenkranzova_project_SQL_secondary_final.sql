CREATE TABLE t_tereza_rosenkranzova_project_SQL_secondary_final AS
SELECT 
	c.country AS stat, 
	c.continent AS kontinent, 
	c.independence_date AS datum_nezavislosti, 
	e.YEAR AS rok, 
	e.GDP AS HDP, 
	e.population AS populace, 
	e.gini AS gini_koeficient  
FROM countries c 
JOIN economies e 
ON c.country = e.country 
	AND c.independence_date <= e.YEAR
WHERE c.continent = 'Europe' AND e.YEAR BETWEEN 2006 AND 2018; 