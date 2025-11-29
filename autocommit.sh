#!/bin/bash

# ============================================================
# UNICORN-BARF — Auto Git Backup Script (Clean Version)
# Backs up ONLY the config folder to your GitHub repository.
# ============================================================

CONFIG_DIR=/home/unicorn/printer_data/config
BRANCH=main

cd $CONFIG_DIR

echo ">>> Pulling latest from GitHub..."
git pull origin $BRANCH --no-rebase

echo ">>> Staging changes..."
git add .

echo ">>> Committing..."
current_date=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "Auto-backup: $current_date" || echo "No changes to commit."

echo ">>> Pushing..."
git push origin $BRANCH

echo ">>> Backup Complete!"
