-- 4. otázka
CREATE VIEW v_prum_ceny_i_mzdy AS
SELECT 
	round (avg (prumerna_cena),2) AS prum_cena,
	rok_od,
	round (avg (prumerna_mzda)) AS prum_mzda,
	rok_vyplaty 
FROM t_tereza_rosenkranzova_project_sql_primary_final ttrpspf
WHERE kategorie_potravin != 'Jakostní víno bílé'
GROUP BY rok_od, rok_vyplaty;

CREATE VIEW v_rozdil_cen_a_mezd AS
SELECT 
	DISTINCT round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2007)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2006))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2006)*100,2) AS rozdil_cen_2007,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2008)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2007))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2007)*100,2) AS rozdil_cen_2008,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2009)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2008))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2008)*100,2) AS rozdil_cen_2009,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2010)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2009))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2009)*100,2) AS rozdil_cen_2010,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2011)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2010))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2010)*100,2) AS rozdil_cen_2011,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2012)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2011))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2011)*100,2) AS rozdil_cen_2012,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2013)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2012))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2012)*100,2) AS rozdil_cen_2013,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2014)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2013))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2013)*100,2) AS rozdil_cen_2014,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2015)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2014))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2014)*100,2) AS rozdil_cen_2015,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2016)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2015))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2015)*100,2) AS rozdil_cen_2016,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2017)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2016))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2016)*100,2) AS rozdil_cen_2017,
	round (((SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2018)-(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2017))/(SELECT (prum_cena)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_od =2017)*100,2) AS rozdil_cen_2018,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2007)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2006))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2006)*100,2) AS rozdil_mezd_2007,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2008)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2007))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2007)*100,2) AS rozdil_mezd_2008,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2009)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2008))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2008)*100,2) AS rozdil_mezd_2009,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2010)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2009))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2009)*100,2) AS rozdil_mezd_2010,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2011)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2010))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2010)*100,2) AS rozdil_mezd_2011,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2012)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2011))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2011)*100,2) AS rozdil_mezd_2012,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2013)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2012))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2012)*100,2) AS rozdil_mezd_2013,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2014)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2013))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2013)*100,2) AS rozdil_mezd_2014,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2015)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2014))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2014)*100,2) AS rozdil_mezd_2015,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2016)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2015))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2015)*100,2) AS rozdil_mezd_2016,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2017)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2016))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2016)*100,2) AS rozdil_mezd_2017,
	round (((SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2018)-(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2017))/(SELECT (prum_mzda)
	FROM v_prum_ceny_i_mzdy pcim 
	WHERE rok_vyplaty =2017)*100,2) AS rozdil_mezd_2018
FROM v_prum_ceny_i_mzdy pcim; 

SELECT 
	CASE 
		WHEN(rozdil_cen_2007)-(rozdil_mezd_2007)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2007,
	CASE 
		WHEN (rozdil_cen_2008)-(rozdil_mezd_2008)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2008,
	CASE 
		WHEN (rozdil_cen_2009)-(rozdil_mezd_2009)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2009,
	CASE
		WHEN (rozdil_cen_2010)-(rozdil_mezd_2010)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2010,
	CASE 
		WHEN (rozdil_cen_2012)-(rozdil_mezd_2011)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2011,
	CASE 
		WHEN (rozdil_cen_2012)-(rozdil_mezd_2012)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2012,
	CASE 
		WHEN (rozdil_cen_2013)-(rozdil_mezd_2013)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2013,
	CASE 
		WHEN (rozdil_cen_2014)-(rozdil_mezd_2014)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2014,
	CASE
		WHEN (rozdil_cen_2015)-(rozdil_mezd_2015)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2015,
	CASE 
		WHEN (rozdil_cen_2016)-(rozdil_mezd_2016)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2016,
	CASE 
		WHEN (rozdil_cen_2017)-(rozdil_mezd_2017)>10 THEN '>10' ELSE '<10'
	END	AS rozdil_2017,
	CASE
		WHEN (rozdil_cen_2018)-(rozdil_mezd_2018)>10 THEN '>10' ELSE '<10'
	END AS rozdil_2018
FROM v_rozdil_cen_a_mezd;

