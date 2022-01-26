#!/bin/bash

# Script for website deployment
# run in terminal with "sh script_name.sh"

# Synchronize website with source files
sudo rsync -axP --exclude=".git" --delete \
    /home/tom/Documents/my_website/personal_website/_site/ \
    /home/tom/Documents/my_website/tomasplihal.github.io

# Pull to github with automatic commit message
cd /home/tom/Documents/my_website/tomasplihal.github.io

# If a command fails then the deploy stops
set -e

# Confirm with user
read -n 1 -p "Push to GitHub? (enter or ctrl+c):" input

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Add changes to git
git add .

# Commit changes
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source
git push origin master

echo "Backup FINISHED!!!"
 
