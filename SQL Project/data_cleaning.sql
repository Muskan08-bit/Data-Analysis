-- DATA CLEANING

SELECT *
FROM world_layoffs.layoffs;

-- 1. Remove duplicates
-- 2. Standardize the data: issues with spellings
-- 3. Null values or blank values
-- 4. Remove any column or rows that are not necessary

-- FOR THE SAFETY PURPOSE FOR 4TH STEP or a backup
CREATE TABLE layoffs_staging
LIKE world_layoffs.layoffs;

SELECT * FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

-- 1st Step
-- generally, there is a column for unique row id which made that easy to remove the duplicates
-- here, there is no identifying factor that is going to be easy for that so, removing this duplicates is not going to be esasy
-- Have a row number and we will match it against all of these columns and then we will see if there are any duplicates

-- do partition with all the columns so, at first try to do with few columns to see if we get any hits

WITH duplicate_cte as(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
where row_num > 1;

-- got the duplicate rows and now check it
SELECT *
FROM world_layoffs.layoffs
where company = 'Oda';
-- have checked that the total 3 rows are differenct so, now we have to take partition by with each column

WITH duplicate_cte as(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
where row_num > 1;

-- now check again for duplicates
SELECT *
FROM world_layoffs.layoffs
where company = 'Casper';

-- delete duplicates from table and this is not possible to do in CTE as error occur delete is not updatable
-- so to delete those we will create new table, add this row into that and then delete using filter

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;

INSERT into layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
FROM layoffs_staging;

delete
FROM layoffs_staging2
where row_num > 1;