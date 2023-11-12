Průvodní zpráva

Pro projekt bylo potřeba vytvořit datové podklady ze základních tabulek, které jsme měli k dispozici. Jako první jsem upravila tabulku czechia_price, kde nalezneme informace o cenách vybraných potravin za období od začátku roku 2006 do roku 2018. Data sice také nejsou stejná, od roku 2006 do roku 2008 jsou ceny potravin zadané po týdnu, od roku 2009 do 2010 jsou uvedeny pouze dva týdny v měsíci a od roku 2011 jsou uvedeny pouze jednou měsíčně. Ale rozhodla jsem se, že pro průměrnou cenu za rok mi tyto hodnoty stačí. Také jsem zjistila, že pro kategorii Jakostní víno bílé jsou v podkladech data pouze od roku 2014, takže jsem tuto kategorii později vynechala.

K tabulce czechia_price jsem napojila tabulku czechia_price_category, kde se nachází číselník kategorií potravin s názvy potravin. Lépe se mi pracovalo s názvy, než s kódy a pro lepší přehled jsem si kategorie přejmenovala do českých názvů, abych se v nich pro svůj první projekt SQL lépe orientovala. Vybrala jsem kategorie, které jsem myslela, že budu potřebovat a vytvořila jsem si tabulku, kde jsem si z dat vytvořila sloupce přímo s roky. V dalším kroku jsem udělala průměry z cen za jednotlivé kategorie potravin a jednotlivých let, pro zjednodušení jsem si vybrala kategorii region code pouze řádky s hodnotami NULL, které jsem zjistila, že jsou průměrem za celou Českou republiku, ale nakonec stejně by to fungovalo i bez tohoto kritéria, protože by se dělal průměr ze všech dat ze všech regionů. 

V tabulce czechia_payroll nalezneme informace o mzdách v různých odvětvích za období od roku 2000 do roku 2021. Data jsou dále časově rozdělena do kvartálů. Počty zaměstnanců jsou uvedeny pouze u některých oborů, takže jsem je vynechala, nepočítala jsem vážené průměry. Výši mzdy jsem brala pro přepočtené počty zaměstnanců (kde je zohledněn počet a výše úvazků). K této tabulce jsem připojila tabulku czechia_payroll_industry_branch kde nalezneme číselník odvětví v tabulce mezd. Vybrala jsem zvolené kategorie a vytvořila si tabulku s průměrnými mzdami, kterou jsem spojila s připravenou tabulkou pro ceny. Tak jsem si připravila první podkladovou tabulku pro projekt.

Druhou projektovou tabulku jsem připravila spojením tabulek countries a economies, kde jsem si vyfiltrovala státy a kontinenty (zajímaly mě pouze evropské státy), roky z důvodu napojení tabulek a ohraničení časového rámce shodného s první projektovou tabulkou (2006 – 2018), HDP, populaci a gini koeficient. 

Výzkumné otázky 

1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Průměrné mzdy ve všech odvětvích rostou. U všech je mzda v roce 2018 vyšší než v roce 2006.

2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
V roce 2006 je možné si za průměrnou mzdu v celé České republice koupit 1313 kg chleba nebo trochu přes 1465 litrů mléka. V roce 2018 je možné si zakoupit 1365 kg chleba nebo 1669 a půl litru mléka. Zajímavé je, že chlebů si můžeme v roce 2018 koupit o 52 kg více, ale mléka si můžeme koupit o 204 litrů více, takže cena chleba se zvýšila poměrově více, než cena mléka.

3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
U dvou kategorií potravin jsem zjistila, že ceny dokonce zlevnily v průběhu času (po součtu meziročních nárůstů během sledovaného období). Nejvíce zlevnily za sledovanou dobu rajská jablka červená kulatá a to o 1,48 procent.

4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Ve všech letech ve sledovaném období byl růst cen potravin v poměru k výši mezd pod 10%.

5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
Po porovnání procentuálních nárůstů HDP, cen i mezd jsem neshledala, že by mezi HDP a cenami a mzdami byla jakákoliv korelace ani ve stejném ani v následujícím roce.
