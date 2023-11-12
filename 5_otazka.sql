-- 5. otazka
CREATE OR REPLACE VIEW v_hdp_CZ AS
SELECT 
	rok,
	HDP
FROM t_tereza_rosenkranzova_project_sql_secondary_final ttrpssf 
WHERE stat = 'Czech Republic'
ORDER BY rok;

CREATE OR REPLACE VIEW v_hdp_ceny_mzdy AS 
SELECT 
	vhc.rok,
	round (vhc.HDP) AS HDP,
	prum_cena,
	prum_mzda 
FROM v_hdp_cz vhc 
JOIN v_prum_ceny_i_mzdy vpcim 
ON vhc.rok = vpcim.rok_od AND vhc.rok = vpcim.rok_vyplaty 
ORDER BY rok 

CREATE OR REPLACE VIEW v_2007 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2007)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2006))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2006)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2007)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2006))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2006)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2007)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2006))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2006)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2007;
 
CREATE OR REPLACE VIEW v_2008 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2008)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2007))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2007)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2008)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2007))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2007)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2008)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2007))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2007)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2008;

CREATE OR REPLACE VIEW v_2009 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2009)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2008))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2008)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2009)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2008))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2008)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2009)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2008))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2008)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2009;

CREATE OR REPLACE VIEW v_2010 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2010)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2009))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2009)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2010)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2009))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2009)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2010)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2009))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2009)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2010;

CREATE OR REPLACE VIEW v_2011 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2011)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2010))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2010)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2011)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2010))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2010)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2011)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2010))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2010)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2011;

CREATE OR REPLACE VIEW v_2012 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2012)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2011))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2011)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2012)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2011))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2011)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2012)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2011))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2011)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2012;

CREATE OR REPLACE VIEW v_2013 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2013)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2012))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2012)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2013)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2012))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2012)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2013)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2012))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2012)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2013;

CREATE OR REPLACE VIEW v_2014 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2014)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2013))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2013)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2014)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2013))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2013)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2014)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2013))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2013)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2014;

CREATE OR REPLACE VIEW v_2015 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2015)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2014))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2014)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2015)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2014))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2014)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2015)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2014))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2014)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2015;

CREATE OR REPLACE VIEW v_2016 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2016)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2015))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2015)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2016)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2015))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2015)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2016)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2015))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2015)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2016;

CREATE OR REPLACE VIEW v_2017 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2017)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2016))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2016)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2017)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2016))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2016)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2017)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2016))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2016)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2017;

CREATE OR REPLACE VIEW v_2018 AS
SELECT 
	round (((SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2018)-(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2017))/(SELECT (HDP)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2017)*100,2) AS rozdil_HDP,
	round (((SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2018)-(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2017))/(SELECT (prum_cena)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2017)*100,2) AS rozdil_ceny,
	round (((SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm 
	WHERE rok = 2018)-(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2017))/(SELECT (prum_mzda)
	FROM v_hdp_ceny_mzdy vhcm  
	WHERE rok = 2017)*100,2) AS rozdil_mzdy
FROM v_hdp_ceny_mzdy vhcm
WHERE rok = 2018;

SELECT *
FROM v_2007 v07
UNION 
SELECT *
FROM v_2008 v08 
UNION
SELECT *
FROM v_2009 v09
UNION
SELECT *
FROM v_2010 v10
UNION 
SELECT *
FROM v_2011 v11
UNION
SELECT *
FROM v_2012 v12
UNION
SELECT *
FROM v_2013 v13
UNION
SELECT *
FROM v_2014 v14
UNION
SELECT *
FROM v_2015 v15
UNION
SELECT *
FROM v_2016 v16
UNION
SELECT *
FROM v_2017 v17
UNION
SELECT *
FROM v_2018 v18;