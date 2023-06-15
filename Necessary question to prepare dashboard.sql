-- what is the gender distirbution of the employees in company?
SELECT gender, count(*) from hr WHERE termdate ='0000-00-00' GROUP BY gender; 
-- 2. what is the race/ethnicity breakdown of employees in the company?
SELECT race, count(*) AS 'Count' from hr where termdate ='0000-00-00' GROUP BY race;
-- 3. what is the age distribution of employees in the company?
SELECT min(age) as YOUNGEST, max(age) as oldest from hr where termdate ='0000-00-00';
SELECT CASE
    WHEN age >= 18 and age <=24 then '18-24'
    WHEN age >= 25 and age <=30 then '25-30'
    WHEN age >= 31 and age <=34 then '31-34'
    WHEN age >= 35 and age <=40 then '35-40'
    WHEN age >= 41 and age <=50 then '41-50'
    WHEN age >= 51 and age <=57 then '51-57'
    ELSE '57+'
END AS age_distribution, gender, count(*) as 'count' from hr where termdate ='0000-00-00'
GROUP BY age_distribution, gender
order by age_distribution,gender;
-- HOw many employees work from headquarters and remote?
SELECT location, count(*) as 'COUNT' from hr where termdate = '0000-00-00' GROUP BY location;
-- what is the average length of employeement?
SELECT avg(datediff(termdate,hire_date))/365 AS avg_length_of_employement FROM hr where termdate <= curdate() AND termdate <> '0000-00-00';
-- 6. How does the gender distribution vary across departments and job titles?
Select gender, department , count(*) from hr where termdate ='0000-00-00' group by gender, department order by department;
-- 7. what is the distribution of job titles across the company?
select jobtitle, count(*)as 'COUNT' from hr where termdate = '0000-00-00' group by jobtitle order by jobtitle asc
-- 8. which department has the highest turnover rate?
select department, total_count, terminated_count, terminated_count/total_count as termination_rate 
from (select department, count(*) 
as total_count ,sum(case when termdate <> '0000-00-00'and termdate <= curdate() then 1 else 0 end) as terminated_count
from hr GROUP BY department) as subquery order by termination_rate desc;
-- what is the distribution of employees across locations by city and state?
select location_city, location_state, count(*) as 'count' from hr group by location_city order by count desc;
-- how has the company's employee count changed over time based on hire and term date?
SELECT year, hires , terminations, hires-terminations as net_change, round((hires-terminations)/hires*100,2) as net_change_percent
FROM (SELECT YEAR(hire_date) as year, count(*) as hires, SUM(CASE WHEN termdate = '0000-00-00' AND termdate <= curdate() then 1 else 0 end) as terminations
FROM hr where age >= 18 GROUP BY YEAR(hire_date)) as subquery order by year desc;
-- what is the tenure distribution of each department?
select department, round(avg(datediff(termdate, hire_date)/365),0) as tenure_length from hr where termdate <>'0000-00-00' and termdate <= curdate() GROUP BY department order by tenure_length desc;