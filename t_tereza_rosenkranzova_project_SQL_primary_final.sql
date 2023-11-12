
CREATE TABLE t_t_r_ceny_mezitabulka
SELECT 
	cpc.name AS kategorie_potravin,
	cpc.price_value AS hodnota,
	cpc.price_unit AS jednotky, 
	cp.value AS cena,
	cp.date_from AS datum_od,
	YEAR (cp.date_from) AS rok_od,
	cp.date_to AS datum_do,
	YEAR (cp.date_to) AS rok_do,
	cp.category_code,
	cpc.code,
	cp.region_code
FROM czechia_price cp
JOIN czechia_price_category cpc 
ON cp.category_code = cpc.code 
ORDER BY cp.date_from;

CREATE TABLE t_t_r_prumerne_ceny
SELECT 
	kategorie_potravin,
	hodnota,
	jednotky,
	round (avg (cena),2) AS prumerna_cena,
	rok_od,
	rok_do
FROM t_t_r_ceny_mezitabulka ttrcm 
WHERE region_code IS null
GROUP BY kategorie_potravin, rok_od; 
 
CREATE TABLE t_tereza_rosenkranzova_tabu AS
SELECT *,
	avg (value)
FROM czechia_payroll cp 
WHERE calculation_code = 200 AND unit_code = 200 
GROUP BY payroll_year, industry_branch_code;

CREATE TABLE t_t_r_mzdy_mezitabulka
SELECT 
	cpib.name AS nazev_odvetvi,
	avg (cp.value) AS prumerna_mzda,
	cp.payroll_year AS rok_vyplaty
	cpib.code AS kod_odvetvi
FROM czechia_payroll cp 
JOIN czechia_payroll_industry_branch cpib 
ON cp.industry_branch_code = cpib.code 
WHERE cp.calculation_code = 200 AND cp.unit_code = 200 
GROUP BY cp.payroll_year, cp.industry_branch_code;

CREATE TABLE t_tereza_rosenkranzova_project_sql_primary_final AS
SELECT *
FROM t_t_r_prumerne_ceny rpc 
JOIN t_t_r_mzdy_mezitabulka rmm 
ON rpc.rok_od = rmm.rok_vyplaty; 
