 Data Sources
CSV File: Flat salary dataset with fields like job_title, experience_level, salary, company_size, etc.

JSON File: Same salary data in semi-structured format used to demonstrate handling of VARIANT columns in Snowflake.

 Pipeline Overview
Component	Role
AWS S3	Stores incoming .csv and .json files
Snowpipe	Automatically ingests new files from S3 into Snowflake raw tables
Streams	Tracks changes in raw tables for incremental processing
Tasks	Scheduled transformations and movement to staging/reporting layers
SQL Views	Aggregates and presents cleaned salary insights for analysis

 Reporting Output
View Name: vw_avg_salary_by_role

Purpose: Shows average salary by job_title and experience_level

SQL
SELECT * FROM vw_avg_salary_by_role;


Sample Output:

job_title	experience_level	avg_salary_usd
Data Scientist	EN	110000
AI Engineer	SE	250100
Business Intelligence	EN	76000
Software Engineer	SE	162500
