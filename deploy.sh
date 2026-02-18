#!/bin/bash

# Variables
APP_DIR="/home/ec2-user/Tas-3-mysql"
LOG_FILE="/home/ec2-user/deploy.log"
APP_NAME="bezkoder-app"

echo "====================================" >> $LOG_FILE
echo "Deployment started at $(date)" >> $LOG_FILE

# Go to app directory
cd $APP_DIR || {
  echo "App directory not found!" >> $LOG_FILE
  exit 1
}

# Pull latest code
git pull origin master >> $LOG_FILE 2>&1

# Install dependencies
npm install >> $LOG_FILE 2>&1

# Restart application
pm2 restart $APP_NAME >> $LOG_FILE 2>&1

echo "Deployment completed at $(date)" >> $LOG_FILE
echo "====================================" >> $LOG_FILE
