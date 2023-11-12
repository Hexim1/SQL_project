-- 1. otazka
SELECT 
	nazev_odvetvi,
	round (avg (prumerna_mzda)) AS prumer_mezd,
	rok_vyplaty
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf
WHERE rok_vyplaty = 2006 OR rok_vyplaty = 2018 
GROUP BY rok_vyplaty, nazev_odvetvi  
ORDER BY nazev_odvetvi, rok_vyplaty;

CREATE TABLE t_t_r_prumer_mezd_2006
SELECT 
	nazev_odvetvi,
	round (avg (prumerna_mzda)) AS prumer_mezd_2006,
	rok_vyplaty
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf
WHERE rok_vyplaty = 2006 
GROUP BY rok_vyplaty, nazev_odvetvi  
ORDER BY nazev_odvetvi, rok_vyplaty;

CREATE TABLE t_t_r_prumer_mezd_2018
SELECT 
	nazev_odvetvi,
	round (avg (prumerna_mzda)) AS prumer_mezd_2018,
	rok_vyplaty
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf
WHERE rok_vyplaty = 2018 
GROUP BY rok_vyplaty, nazev_odvetvi  
ORDER BY nazev_odvetvi, rok_vyplaty;

SELECT 
	pm.nazev_odvetvi,
	pm.prumer_mezd_2006,
	pm2.prumer_mezd_2018
FROM t_t_r_prumer_mezd_2006 pm 
JOIN t_t_r_prumer_mezd_2018 pm2 
ON pm.nazev_odvetvi = pm2.nazev_odvetvi;

SELECT 
	pm.nazev_odvetvi,
	CASE 
		WHEN (pm2.prumer_mezd_2018)> (pm.prumer_mezd_2006) THEN 'Rostou' ELSE 'Klesají'
	END AS zmena_mezd
FROM t_t_r_prumer_mezd_2006 pm 
JOIN t_t_r_prumer_mezd_2018 pm2 
ON pm.nazev_odvetvi = pm2.nazev_odvetvi;