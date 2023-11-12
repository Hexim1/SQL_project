-- 3. otazka
SELECT 
	kategorie_potravin,
	hodnota,
	jednotky,
	avg (prumerna_cena),
	rok_od
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf 
GROUP BY kategorie_potravin, rok_od; 

CREATE OR REPLACE VIEW v_t_r_3_otazka AS
SELECT 
	kategorie_potravin,
	hodnota,
	jednotky,
	avg (prumerna_cena) AS prum_cena,
	rok_od
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf 
GROUP BY kategorie_potravin, rok_od;

CREATE OR REPLACE TABLE t_t_r_cena_2006 AS 
SELECT 
	kategorie_potravin,
	hodnota,
	jednotky,
	prum_cena AS cena_2006	
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2006;

CREATE OR REPLACE TABLE t_t_r_cena_2007 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2007
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2007;  

CREATE OR REPLACE TABLE t_t_r_cena_2008 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2008
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2008;

CREATE OR REPLACE TABLE t_t_r_cena_2009 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2009
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2009;

CREATE OR REPLACE TABLE t_t_r_cena_2010 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2010
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2010;

CREATE OR REPLACE TABLE t_t_r_cena_2011 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2011
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2011;

CREATE OR REPLACE TABLE t_t_r_cena_2012 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2012
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2012;

CREATE OR REPLACE TABLE t_t_r_cena_2013 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2013
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2013;

CREATE OR REPLACE TABLE t_t_r_cena_2014 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2014
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2014;

CREATE OR REPLACE TABLE t_t_r_cena_2015 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2015
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2015;

CREATE OR REPLACE TABLE t_t_r_cena_2016 AS 
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2016
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2016;

CREATE OR REPLACE TABLE t_t_r_cena_2017 AS
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2017
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2017;

CREATE OR REPLACE TABLE t_t_r_cena_2018 AS
SELECT 
	kategorie_potravin,
	prum_cena AS cena_2018
FROM v_t_r_3_otazka vtro 
WHERE rok_od = 2018;

CREATE TABLE t_t_r_prumerne_ceny_v_letech AS 
SELECT 
	rc.kategorie_potravin,
	rc.hodnota,
	rc.jednotky,
	rc.cena_2006,
	ttrc.cena_2007,
	ttrc2.cena_2008,
	ttrc3.cena_2009,
	ttrc4.cena_2010,
	ttrc5.cena_2011,
	ttrc6.cena_2012,
	ttrc7.cena_2013,
	ttrc8.cena_2014,
	ttrc9.cena_2015,
	ttrc10.cena_2016,
	ttrc11.cena_2017,
	ttrc12.cena_2018 
FROM t_t_r_cena_2006 rc 
LEFT JOIN t_t_r_cena_2007 ttrc  
ON rc.kategorie_potravin = ttrc.kategorie_potravin 
LEFT JOIN t_t_r_cena_2008 ttrc2  
ON rc.kategorie_potravin = ttrc2.kategorie_potravin 
LEFT JOIN t_t_r_cena_2009 ttrc3 
ON rc.kategorie_potravin = ttrc3.kategorie_potravin
LEFT JOIN t_t_r_cena_2010 ttrc4 
ON rc.kategorie_potravin = ttrc4.kategorie_potravin
LEFT JOIN t_t_r_cena_2011 ttrc5 
ON rc.kategorie_potravin = ttrc5.kategorie_potravin
LEFT JOIN t_t_r_cena_2012 ttrc6 
ON rc.kategorie_potravin = ttrc6.kategorie_potravin
LEFT JOIN t_t_r_cena_2013 ttrc7 
ON rc.kategorie_potravin = ttrc7.kategorie_potravin
LEFT JOIN t_t_r_cena_2014 ttrc8 
ON rc.kategorie_potravin = ttrc8.kategorie_potravin
LEFT JOIN t_t_r_cena_2015 ttrc9 
ON rc.kategorie_potravin = ttrc9.kategorie_potravin
LEFT JOIN t_t_r_cena_2016 ttrc10 
ON rc.kategorie_potravin = ttrc10.kategorie_potravin
LEFT JOIN t_t_r_cena_2017 ttrc11 
ON rc.kategorie_potravin = ttrc11.kategorie_potravin
LEFT JOIN t_t_r_cena_2018 ttrc12 
ON rc.kategorie_potravin = ttrc12.kategorie_potravin;

CREATE OR REPLACE TABLE t_mezirocni_narust_cen AS
SELECT 
	kategorie_potravin,
	hodnota,
	jednotky,
	cena_2006, 
	round((((cena_2007)-(cena_2006))/(cena_2006)*100),2) AS rozdil_2007,
	round((((cena_2008)-(cena_2007))/(cena_2007)*100),2) AS rozdil_2008,
	round((((cena_2009)-(cena_2008))/(cena_2008)*100),2) AS rozdil_2009,
	round((((cena_2010)-(cena_2009))/(cena_2009)*100),2) AS rozdil_2010,
	round((((cena_2011)-(cena_2010))/(cena_2010)*100),2) AS rozdil_2011,
	round((((cena_2012)-(cena_2011))/(cena_2011)*100),2) AS rozdil_2012,
	round((((cena_2013)-(cena_2012))/(cena_2012)*100),2) AS rozdil_2013,
	round((((cena_2012)-(cena_2013))/(cena_2013)*100),2) AS rozdil_2014,
	round((((cena_2015)-(cena_2014))/(cena_2014)*100),2) AS rozdil_2015,
	round((((cena_2016)-(cena_2015))/(cena_2015)*100),2) AS rozdil_2016,
	round((((cena_2017)-(cena_2016))/(cena_2016)*100),2) AS rozdil_2017,
	round((((cena_2018)-(cena_2017))/(cena_2017)*100),2) AS rozdil_2018
FROM t_t_r_prumerne_ceny_v_letech ttrpcvl; 

SELECT 
	kategorie_potravin,
	hodnota,
	jednotky,
	round(((rozdil_2007)+(rozdil_2008)+(rozdil_2009)+(rozdil_2010)+(rozdil_2011)+(rozdil_2012)+(rozdil_2013)
	+(rozdil_2014)+(rozdil_2015)+(rozdil_2016)+(rozdil_2017)+(rozdil_2018))/12, 2) AS prumer_zdrazovani
FROM t_mezirocni_narust_cen tmnc 
ORDER BY prumer_zdrazovani;
