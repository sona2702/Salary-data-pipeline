
from pyspark.sql import SparkSession
import boto3
import os
from dotenv import load_dotenv

# Load AWS credentials
load_dotenv()

# Create a dummy SparkSession (required by PySpark, even if we use boto3)
spark = SparkSession.builder     .appName("S3Upload")     .getOrCreate()

# Use boto3 for file upload
s3 = boto3.client('s3',
    aws_access_key_id=os.getenv("AWS_ACCESS_KEY"),
    aws_secret_access_key=os.getenv("AWS_SECRET_KEY")
)

# Bucket and file details
BUCKET_NAME = "your-bucket-name"
LOCAL_FILE = "data/DataScience_salaries_2025_v2.json"
S3_KEY = "DataScience_salaries_2025_v2.json"

# Upload
s3.upload_file(LOCAL_FILE, BUCKET_NAME, S3_KEY)
print(f"✅ Uploaded {LOCAL_FILE} to s3://{BUCKET_NAME}/{S3_KEY}")
