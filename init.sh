#!/bin/bash

echo "Initializing William."

# TASK: add william as a cronjob
# ==============================

# save current crontab tasks
crontab -l > mycron

# create cron storage directory
[ ! -d "$HOME/bin" ] && mkdir $HOME/bin && echo "> bin created"

# copy script to store locally
cp william.sh $HOME/bin/william.sh
chmod +x $HOME/bin/william.sh
echo "> copied script and made executable"

# insert new cron job
echo "01 22 * * * bash $HOME/bin/william.sh" >> mycron

# install new cron file and get rid of the temp cron
crontab mycron && rm mycron && echo "> removed cron"

echo "> William is at your service."

echo "> Setting up mackenzie"

[ ! -d "$HOME/bin/mackenzie" ] && git clone https://github.com/middleverse/mackenzie.git $HOME/bin/mackenzie && echo "> mackenzie ready"

# POST INSTALL OVERVIEW
# =====================
# a cron that runs daily at the specified
# time above. Look in william.sh script for details.
