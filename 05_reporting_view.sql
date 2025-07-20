
CREATE OR REPLACE VIEW vw_avg_salary_by_role AS
SELECT job_title, experience_level, AVG(salary_in_usd) AS avg_salary_usd
FROM stg_salary_data
GROUP BY job_title, experience_level;
