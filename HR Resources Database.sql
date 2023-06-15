CREATE DATABASE HR;
USE hr;
SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

SELECT * FROM hr;

DESCRIBE hr;
SET sql_safe_updates =0;
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
Modify COLUMN Birthdate date;

SELECT hire_date from hr;

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL
END;
SELECT termdate from hr;

ALTER TABLE hr
Modify COLUMN hire_date DATE;

UPDATE hr
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%S UTC'))
WHERE termdate IS NOT NULL AND termdate != '';
SELECT termdate from hr;

ALTER TABLE hr
Modify COLUMN termdate DATE;

SELECT termdate from hr;

select * from hr;

Describe hr;
ALTER TABLE hr
ADD COLUMN age int;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT birthdate , age FROM hr;

SELECT min(age) as 'Youngest', max(age) as 'Eldest' from hr;