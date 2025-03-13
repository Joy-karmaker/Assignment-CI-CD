#!/bin/bash

APP_NAME="node-app"
DEPLOY_DIR="C:/node-app"
GITHUB_WORK_DIR="$HOME/_work/Assignment-CI-CD/Assignment-CI-CD"

echo "Stopping existing application..."
pm2 stop $APP_NAME || true

echo "Copying new build..."
rm -rf $DEPLOY_DIR/*
cp -r $GITHUB_WORK_DIR/* $DEPLOY_DIR/

echo "Installing dependencies..."
cd $DEPLOY_DIR || exit
npm install --production

echo "Restarting application..."
pm2 restart $APP_NAME || pm2 start app.js --name $APP_NAME

echo "Deployment complete!"
