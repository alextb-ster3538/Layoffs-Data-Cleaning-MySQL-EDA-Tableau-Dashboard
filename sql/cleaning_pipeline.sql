CREATE DATABASE layoffs_v1_db;

USE layoffs_v1_db;

-- copy the 'layoffs' table into 'layoffs_staging'
CREATE TABLE layoffs_staging
LIKE layoffs;

-- Insert contents of raw table into layoffs_staging
INSERT layoffs_staging
SELECT * 
FROM layoffs;

-- check if successful
-- 2361 rows returned
SELECT *
FROM layoffs_staging;
-- check and modify data types as necessary
DESCRIBE layoffs_staging;
-- Fix format of date e.g. 2/20/2020

SELECT `date`,
       STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging;

-- Update the date format in the date column of the existing table
UPDATE layoffs_staging
SET date = STR_TO_DATE(date, '%m/%d/%Y');

-- Verify the format change took effect
SELECT `date`
FROM layoffs_staging;
-- Change `date` column data type from string to date 
ALTER TABLE layoffs_staging
MODIFY COLUMN `date` DATE; 
-- Standardizing column names to lower case and snake case not necessary
-- 
UPDATE layoffs_staging
SET company = TRIM(company);

SELECT *
FROM layoffs_staging;

SELECT DISTINCT company 
FROM layoffs_staging;

SELECT DISTINCT location
FROM layoffs_staging;

SELECT *
FROM layoffs_staging
WHERE location LIKE "%Non-U.S%";

SHOW VARIABLES LIKE 'character_set%';

-- 
UPDATE layoffs_staging
SET location = CONVERT(CAST(location AS BINARY) USING utf8mb4);

SELECT location
FROM layoffs_staging;

SELECT location, HEX(location)
FROM layoffs_staging
WHERE location LIKE '%Florian%';
-- the code below did not work-did not replace the special characters
UPDATE layoffs_staging
SET location = CONVERT(CAST(CONVERT(CAST(location AS BINARY) USING latin1) AS BINARY) USING utf8mb4)
WHERE location LIKE '%Florian%';

-- Remove and replace special characters in location accordingly 
UPDATE layoffs_staging
SET location = 'Florianópolis'
WHERE location LIKE '%Florian%';


SELECT *
FROM layoffs_staging
WHERE location REGEXP '[^ -~]';


UPDATE layoffs_staging
SET location = 'Malmo'
WHERE location LIKE '%Malm%';


UPDATE layoffs_staging
SET location = 'Dusseldorf'
WHERE location LIKE 'Düsseldorf%';

--

SELECT *
FROM layoffs_staging;

-- Replace Non-U.S. with Seychelles (the company is registered in the Seychelles)
UPDATE layoffs_staging
SET location = 'Seychelles'
WHERE location = 'Non-U.S.'
  AND company = 'BitMEX'; 

UPDATE layoffs_staging
SET location = 'China'
WHERE location = 'Non-U.S.'
  AND company = 'WeDoctor'; 
  
  
SELECT *
FROM layoffs_staging
WHERE country = 'United States'; 

SELECT DISTINCT country
FROM layoffs_staging;

-- standardize column "country" United States.
UPDATE layoffs_staging
SET country = 'United States'
WHERE country = 'United States.';
-- standardize column "company"
SELECT DISTINCT company, country, total_laid_off, date, percentage_laid_off, location
FROM layoffs_staging
ORDER BY company;

-- CHeck for legal suffixes
SELECT DISTINCT company
FROM layoffs_staging
WHERE company REGEXP 'Inc|LLC|Ltd|GmbH|S\\.A\\.|SA|PLC';

-- Standardize the 'industry' column

UPDATE layoffs_staging
SET industry = 'Crypto'
WHERE industry IN ('Crypto Currency', 'CryptoCurrency');

SELECT *
FROM layoffs_staging
WHERE industry IS NULL OR ' ';

UPDATE layoffs_staging
SET industry = 'Other'
WHERE company LIKE 'Bally%';

SELECT DISTINCT industry
FROM layoffs_staging
WHERE industry = '';

SELECT *
FROM layoffs_staging
WHERE industry = '';

UPDATE layoffs_staging
SET industry = 'Travel'
WHERE company = 'Airbnb';

UPDATE layoffs_staging
SET industry = 'Consumer'
WHERE company = 'Juul';

UPDATE layoffs_staging
SET industry = 'Transportation'
WHERE company = 'Carvana';

SELECT DISTINCT industry
FROM layoffs_staging
ORDER BY industry;

SELECT *
FROM layoffs_staging;
-- Checking whether the 'stage' column requires standardizing 

SELECT *
FROM layoffs_staging
ORDER BY stage;
-- * It does not

-- Remove rows where both 'total_laid_off' and 'percentage_laid_off' are NULL
DELETE
FROM layoffs_staging
WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  
-- checking names of cities based on location with a match to multiple contries
SELECT *
FROM layoffs_staging;

SELECT *
FROM layoffs_staging
WHERE location = 'Brisbane';

SELECT *
FROM layoffs_staging
WHERE location = 'London';

SELECT *
FROM layoffs_staging
WHERE location = 'Oxford';

-- updating the 'country' column based on mismatches detected to 'location'
  
UPDATE layoffs_staging
SET country = CASE
    WHEN location = 'Toronto' AND country <> 'Canada' THEN 'Canada'
    WHEN location = 'Vancouver' AND country <> 'Canada' THEN 'Canada'
    WHEN location = 'Beijing' AND country <> 'China' THEN 'China'
    WHEN location = 'Melbourne' AND country <> 'Australia' THEN 'Australia'
    WHEN location = 'Chennai' AND country <> 'India' THEN 'India'
    WHEN location = 'Dubai' AND country <> 'United Arab Emirates' THEN 'United Arab Emirates'
    WHEN location = 'Copenhagen' AND country <> 'Denmark' THEN 'Denmark'
    WHEN location = 'Eindhoven' AND country <> 'Netherlands' THEN 'Netherlands'
    WHEN location = 'Selangor' AND country <> 'Malaysia' THEN 'Malaysia'
    WHEN location = 'Mexico City' AND country <> 'Mexico' THEN 'Mexico'
	WHEN location = 'New Delhi' AND country <> 'India' THEN 'India'
    WHEN location = 'Sao Paulo' AND country <> 'Brazil' THEN 'Brazil'
    WHEN location = 'Singapore' AND country <> 'Singapore' THEN 'Singapore'
	WHEN location = 'Tel Aviv' AND country <> 'Israel' THEN 'Israel'
	WHEN location = 'Tokyo' AND country <> 'Japan' THEN 'Japan'
	WHEN location = 'Singapore' AND country <> 'Singapore' THEN 'Singapore'
    ELSE country
END;

-- remove duplicates

WITH dupes_cte AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY company, location, industry, total_laid_off,
                            percentage_laid_off, date, stage, country,
                            funds_raised_millions
               ORDER BY company, location, industry, total_laid_off, country
           ) AS rn
    FROM layoffs_staging
)
SELECT *
FROM dupes_cte
WHERE rn > 1;

-- check count where company is greater than 1

SELECT company, COUNT(*) AS cnt
FROM layoffs_staging
GROUP BY company
HAVING COUNT(*) > 1;

-- Inspect the 4 rows with rn 2  by company additionally

SELECT *
FROM layoffs_staging
WHERE company = 'Cazoo';

SELECT *
FROM layoffs_staging
WHERE company = 'Hibob';

SELECT *
FROM layoffs_staging
WHERE company = 'Wildlife Studios';

SELECT *
FROM layoffs_staging
WHERE company = 'Yahoo';

-- Removing one entry of the Cazoo company as a dupe

DELETE FROM layoffs_staging
WHERE (company, location, industry, total_laid_off,
       percentage_laid_off, date, stage, country,
       funds_raised_millions) IN (
    SELECT company, location, industry, total_laid_off,
           percentage_laid_off, date, stage, country,
           funds_raised_millions
    FROM (
        SELECT *,
               ROW_NUMBER() OVER(
                   PARTITION BY company, location, industry, total_laid_off,
                                percentage_laid_off, date, stage, country,
                                funds_raised_millions
                   ORDER BY company
               ) AS rn
        FROM layoffs_staging
    ) AS t
    WHERE rn > 1
);
-- Verify the deletion took place
WITH dupes_cte AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY company, location, industry, total_laid_off,
                                percentage_laid_off, date, stage, country,
                                funds_raised_millions
               ORDER BY company
           ) AS rn
    FROM layoffs_staging
)
SELECT *
FROM dupes_cte
WHERE rn > 1;
-- Check for blanks in string columns
SELECT *
FROM layoffs_staging
WHERE company = ''
   OR location = ''
   OR industry = ''
   OR stage = ''
   OR country = '';

-- Check for blanks in decimal columns
-- ** Spotted that percentage_laid_off is a text column, not a decimal so it needs to be modified accordingly first
-- *** Step 1: Convert blanks to NULL values
UPDATE layoffs_staging
SET percentage_laid_off = NULLIF(percentage_laid_off, '');
 -- **** Step 2: Change column type to decimal
ALTER TABLE layoffs_staging
MODIFY COLUMN percentage_laid_off DECIMAL(5,4);
-- Check table and column
SELECT *
FROM layoffs_staging;

 -- Recheck for blanks
 SELECT *
FROM layoffs_staging
WHERE company = ''
   OR location = ''
   OR industry = ''
   OR stage = ''
   OR country = '';
   
   SELECT *
FROM layoffs_staging
WHERE company = ''
   OR location = ''
   OR industry = ''
   OR stage = ''
   OR country = '';

-- *** No blanks detected***
 -- Create a clean table for further analysis
CREATE TABLE layoffs_clean AS
SELECT *
FROM layoffs_staging;
