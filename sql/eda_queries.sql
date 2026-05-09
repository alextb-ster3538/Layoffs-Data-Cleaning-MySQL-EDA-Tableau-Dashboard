-- Checked the review period 
SELECT MIN(date), MAX(date)
FROM layoffs_clean;

-- View the table (1991 rows, 9 columns)
SELECT *
FROM layoffs_clean;

-- Check the MAX (or most) total_laid_off and percentage_laid_off
SELECT company, MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_clean
GROUP BY company
ORDER BY MAX(total_laid_off) DESC;

-- Check how many entries have (1.0000) 100% percentage laid off 
-- ** There are 116 such entries
SELECT * 
FROM layoffs_clean
WHERE percentage_laid_off = 1;

-- Same but ordered by total_laid_off
SELECT *
FROM layoffs_clean
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;
-- Looked at the 100% lay offs from funds raised in millions
SELECT *
FROM layoffs_clean
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
-- Calculated the total no. of employees across companies that have been laid off within the report period
SELECT company, SUM(total_laid_off)
FROM layoffs_clean
GROUP BY company
ORDER BY SUM(total_laid_off) DESC;




