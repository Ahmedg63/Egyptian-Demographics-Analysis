SELECT * 
FROM Marriage

--------------------------------------------------------
-- Normalize the data in Age_groups

SELECT Age_groups,
CASE
	WHEN Age_groups = 'Less than 15 years' THEN 'Under 15'
	WHEN Age_groups = '15 years' THEN '15' 
	WHEN Age_groups = '16 years' THEN '16' 
	WHEN Age_groups = '17 years' THEN '17' 
	WHEN Age_groups = '18 years' THEN '18' 
	WHEN Age_groups = '19 years' THEN '19' 
	WHEN Age_groups = 'From 20 to less than25' THEN '20-24' 
	WHEN Age_groups = 'From 25 to less than30' THEN '25-29' 
	WHEN Age_groups = 'From 30 to less than35' THEN '30-34' 
	WHEN Age_groups = 'From 35 to less than40' THEN '35-39' 
	WHEN Age_groups = 'From 40 to less than45' THEN '40-44' 
	WHEN Age_groups = 'From 45 to less than50' THEN '45-49' 
	WHEN Age_groups = 'From 50 to less than55' THEN '50-54' 
	WHEN Age_groups = 'From 55 to less than60' THEN '55-59' 
	WHEN Age_groups = 'From 60 to less than65' THEN '60-64' 
	WHEN Age_groups = 'From 65 to less than70' THEN '65-69' 
	WHEN Age_groups = 'From 70 to less than75' THEN '70-74' 
	WHEN Age_groups = '75 and more' THEN '75+' 
	ELSE Age_groups
END AS New_Format
FROM Marriage


UPDATE Marriage
SET Age_groups =
CASE
	WHEN Age_groups = 'Less than 15 years' THEN 'Under 15'
	WHEN Age_groups = '16 years' THEN '16'
	WHEN Age_groups = '17 years' THEN '17'
	WHEN Age_groups = '18 years' THEN '18'
	WHEN Age_groups = '19 years' THEN '19'
	WHEN Age_groups = '15 years' THEN '15'
	WHEN Age_groups = 'From 20 to less than25' THEN '20-24'
	WHEN Age_groups = 'From 25 to less than30' THEN '25-29'
	WHEN Age_groups = 'From 30 to less than35' THEN '30-34' 
	WHEN Age_groups = 'From 35 to less than40' THEN '35-39' 
	WHEN Age_groups = 'From 40 to less than45' THEN '40-44' 
	WHEN Age_groups = 'From 45 to less than50' THEN '45-49' 
	WHEN Age_groups = 'From 50 to less than55' THEN '50-54' 
	WHEN Age_groups = 'From 55 to less than60' THEN '55-59' 
	WHEN Age_groups = 'From 60 to less than65' THEN '60-64' 
	WHEN Age_groups = 'From 65 to less than70' THEN '65-69' 
	WHEN Age_groups = 'From 70 to less than75' THEN '70-74' 
	WHEN Age_groups = '75 and more' THEN '75+'
	ELSE Age_groups
END;


SELECT Age_groups
FROM Marriage

---------------------------------------------------------------------------------------------
--Create a new column to categorize life stages


ALTER TABLE Marriage 
ADD Life_Stage varchar(50);
GO


UPDATE Marriage
SET Life_Stage = CASE 
    WHEN Age_groups IN ('Under 15', '15', '16', '17') THEN 'Minor (Under 18)'
    WHEN Age_groups IN ('18', '19', '20-24', '25-29') THEN 'Young Adult (18-29)'
    WHEN Age_groups IN ('30-34', '35-39', '40-44', '45-49') THEN 'Adult (30-49)'
    WHEN Age_groups IN ('50-54', '55-59', '60-64') THEN 'Senior Adult (50-64)'
    WHEN Age_groups IN ('65-69', '70-74', '75+') THEN 'Elderly (65+)'
    ELSE 'Unknown'
END;


SELECT Life_Stage
FROM Marriage


--------------------------------------------------------------------------------------------------------------------
                                                --EXPLORING THE DATA--

SELECT *
FROM Marriage


--What is the total adult population (excluding minors) living in Urban areas VS Rural areas?


SELECT 
    Region, 
    SUM(Population) AS Total_Adults
FROM Marriage
WHERE Life_Stage != 'Minor (Under 18)'
GROUP BY Region;



--Which Life_Stage has the highest total number of married individuals?

SELECT
	Life_Stage,
	SUM(Population) AS TotalMariagePerLifeStage
FROM Marriage
WHERE Marital_status IN  ('Married','Marriage Contract')
GROUP BY Life_Stage
ORDER BY TotalMariagePerLifeStage DESC



--Are there more unmarried (Never Married) adult men or unmarried adult women in Urban areas?


SELECT  
	Gender,
    SUM(Population) AS UnmarriedAdults
FROM Marriage
WHERE 
	Life_Stage != 'Minor (Under 18)' AND 
	Marital_status = 'Never Married' AND 
	Region = 'Urban'
GROUP BY Gender 
ORDER BY UnmarriedAdults DESC



































