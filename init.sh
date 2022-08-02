#!/bin/bash
echo "Initializing William."

# TASK: add william as a cronjob
# ==============================

# save current crontab tasks
crontab -l > mycron

# copy script to /usr/local/bin
cp william.sh /usr/local/bin/william.sh

# insert new cron job
echo "01 22 * * * bash /usr/local/bin/william.sh" >> mycron

# install new cron file and get rid of the temp cron
crontab mycron && rm mycron

echo "William is at your service."
