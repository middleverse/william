#!/bin/bash

YEARMONTH=$(date +"%Y-%m")
DELIMITER=","
WATSON=$(which watson)
IS_EMPTY=$($WATSON report --day --csv)
LOGFILE=$HOME/bin/william/william.log

# check if watson tracked anything today
if [ -z "${IS_EMPTY}" ]
then
    echo "> no work done on ( $(whoami) ) :: $(date)" >> $LOGFILE
    exit 0
fi

# if we're here, watson did track something
echo "some work done on this machine today $(date)" >> $LOGFILE

# change into mackenzie dir, log work & push to github
cd $HOME/bin/mackenzie

git pull
echo "PULLED FROM GITHUB" >> $LOGFILE

# create timesheet if it doesn't exit
if [[ ! -f "${YEARMONTH}.txt" ]]
then 
    touch ${YEARMONTH}.txt && echo "> this month's log file created" >> $LOGFILE && DELIMITER=""
fi

DUMP=$($WATSON report --day --json)

# concatenate JSON to appropriate file
# note: the delimiter is for valid JSON, it's a comma is the file already contains JSON
echo "${DELIMITER}${DUMP}" >> ${YEARMONTH}.txt

# push changes
git add -A
git commit -m "yes sarge"
git push