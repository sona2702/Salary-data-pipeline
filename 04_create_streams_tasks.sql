
CREATE OR REPLACE STREAM json_salary_stream ON TABLE raw_json_salary;

CREATE OR REPLACE TABLE stg_salary_data (
  work_year INT,
  experience_level STRING,
  employment_type STRING,
  job_title STRING,
  salary_in_usd FLOAT
);

CREATE OR REPLACE TASK load_json_incremental
WAREHOUSE = compute_wh
SCHEDULE = '5 MINUTE'
WHEN SYSTEM$STREAM_HAS_DATA('json_salary_stream')
AS
INSERT INTO stg_salary_data
SELECT
  data:"work_year"::INT,
  data:"experience_level"::STRING,
  data:"employment_type"::STRING,
  data:"job_title"::STRING,
  data:"salary_in_usd"::FLOAT
FROM json_salary_stream;

ALTER TASK load_json_incremental RESUME;
