#!/bin/bash

DB_NAME="bezkoder_db"
DB_USER="root"
DB_PASSWORD="Atharva@123"
BACKUP_DIR="/home/ec2-user/db_backups"
S3_BUCKET="task3-mysql-backups-atharva"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p $BACKUP_DIR

BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_$TIMESTAMP.sql"

mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

if [ $? -eq 0 ]; then
  aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/
fi
