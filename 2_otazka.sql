-- 2. otázka
SELECT 
	DISTINCT (kategorie_potravin),
	prumerna_cena,
	rok_od 
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf 
WHERE kategorie_potravin = 'Chléb konzumní kmínový' AND rok_od = 2006 
OR kategorie_potravin = 'Chléb konzumní kmínový' AND rok_od = 2018;

SELECT 
	DISTINCT (kategorie_potravin),
	prumerna_cena,
	rok_od 
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf 
WHERE kategorie_potravin = 'Mléko polotuèné pasterované' AND rok_od = 2006 
OR kategorie_potravin = 'Mléko polotuèné pasterované' AND rok_od = 2018;

SELECT 
	round (avg (prumerna_mzda)) AS prumer_mezd,
	rok_vyplaty
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf
WHERE rok_vyplaty = 2018 OR rok_vyplaty = 2006
GROUP BY rok_vyplaty;

CREATE VIEW v_t_r_2_otazka AS
SELECT 
	DISTINCT (kategorie_potravin),
	prumerna_cena,
	rok_od,
	(SELECT 
	round (avg (prumerna_mzda)) AS prumer_mezd
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf
WHERE rok_vyplaty = 2018 
GROUP BY rok_vyplaty) AS prumerna_mzda_2018,
	(SELECT 
	round (avg (prumerna_mzda)) AS prumer_mezd
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf
WHERE rok_vyplaty = 2006
GROUP BY rok_vyplaty)AS prumerna_mzda_2006
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf 
WHERE kategorie_potravin = 'Mléko polotuèné pasterované' AND rok_od = 2006 
OR kategorie_potravin = 'Mléko polotuèné pasterované' AND rok_od = 2018
OR kategorie_potravin = 'Chléb konzumní kmínový' AND rok_od = 2006 
OR kategorie_potravin = 'Chléb konzumní kmínový' AND rok_od = 2018;

SELECT *,
	round ((prumerna_mzda_2006)/(prumerna_cena),1) AS pocet_ks_2006
FROM v_t_r_2_otazka vtro;

CREATE VIEW v_t_r_pocet_ks AS 
SELECT *,
	round ((prumerna_mzda_2006)/(prumerna_cena),1) AS pocet_ks_2006,
	round ((prumerna_mzda_2018)/(prumerna_cena),1) AS pocet_ks_2018
FROM v_t_r_2_otazka vtro;

SELECT 
	kategorie_potravin,
	CASE
		WHEN (rok_od = 2006) THEN (pocet_ks_2006) ELSE 0
	END AS pocet_kusu_2006,
	CASE
		WHEN (rok_od = 2018) THEN (pocet_ks_2018) ELSE 0
	END AS pocet_kusu_2018
FROM v_t_r_pocet_ks vtrpk;




