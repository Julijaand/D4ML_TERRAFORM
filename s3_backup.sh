#!/bin/bash

export AWS_DEFAULT_REGION="eu-central-1" 

# Define S3 bucket name and local directory
S3_BUCKET="s3_bucket_for_SFTP_server"
LOCAL_DIR="/opt"

# Perform the backup to S3 every minute (you can use a cron job for scheduling)
while true; do
  aws s3 sync "$LOCAL_DIR" "s3://$S3_BUCKET" --delete
  sleep 60
done
