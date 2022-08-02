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
echo "Your productivity metrics through watson will have "

# POST INSTALL OVERVIEW
# =====================
# a cron that runs daily at the specified
# time above. Look in william.sh script for details.
