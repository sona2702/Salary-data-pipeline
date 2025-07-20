
CREATE OR REPLACE TABLE raw_json_salary (data VARIANT);
CREATE OR REPLACE TABLE raw_csv_salary (
  work_year INT,
  experience_level STRING,
  employment_type STRING,
  job_title STRING,
  salary FLOAT,
  salary_currency STRING,
  salary_in_usd FLOAT,
  employee_residence STRING,
  remote_ratio INT,
  company_location STRING,
  company_size STRING
);
