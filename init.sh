#!/bin/bash

USER=$(whoami)
USERHOME=/Users/$USER

echo "> Initializing William for $USER."

# save current crontab tasks
sudo crontab -u $USER -l > mycron

# create cron storage directory
[ ! -d "$USERHOME/bin" ] && mkdir $USERHOME/bin && echo "> bin created"

# copy script to store locally
cp william.sh $USERHOME/bin/william.sh
chmod a+x $USERHOME/bin/william.sh && echo "> copied script and made executable"

echo ">>>>>> $HOME and $USERHOME"

# insert new cron job
echo "01 22 * * * cd $USERHOME/bin && ./william.sh" >> mycron

# install new cron file and get rid of the temp cron
sudo crontab -u $USER mycron && rm mycron && echo "> added cron to $USER's crontab"

echo "> William is at your service."

echo "> Setting up mackenzie"

[ ! -d "$USERHOME/bin/mackenzie" ] && git clone git@github.com:middleverse/mackenzie.git $HOME/bin/mackenzie && echo "> mackenzie repo is set up"
