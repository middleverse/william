#!/bin/bash

USER=$(whoami)
USERHOME=/Users/$USER
WILLIAMPATH=$USERHOME/bin/william

echo "> Initializing William for $USER."

# save current crontab tasks
sudo crontab -u $USER -l > mycron

# create cron storage directory
[ ! -d "$USERHOME/bin" ] && mkdir $USERHOME/bin && echo "> bin created"
[ ! -d "$USERHOME/bin/william" ] && mkdir $USERHOME/bin/william && echo "> william dir created"

# copy script to store locally
cp william.sh $WILLIAMPATH/william.sh
chmod a+x $WILLIAMPATH/william.sh && echo "> copied script and made executable"

# create a logfile
touch $WILLIAMPATH/william.log

# insert new cron job
echo "01 22 * * * cd $WILLIAMPATH && ./william.sh" >> mycron

# install new cron file and get rid of the temp cron
sudo crontab -u $USER mycron && rm mycron && echo "> added cron to $USER's crontab"

echo "> Setting up mackenzie"

[ ! -d "$USERHOME/bin/mackenzie" ] && git clone git@github.com:middleverse/mackenzie.git $HOME/bin/mackenzie && echo "> mackenzie repo is set up"

echo "> Setting up environment"

echo "export WATSON=$(which watson)" >> $WILLIAMPATH/.env
echo "export LOGFILE=$WILLIAMPATH/william.log" >> $WILLIAMPATH/.env
echo "export MACKENZIE=$HOME/bin/mackenzie" >> $WILLIAMPATH/.env

echo "> William is at your service."

