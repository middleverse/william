#!/bin/bash
source .env

YEAR=$(date +"%Y")
MONTH=$(date +"%m")
DELIMITER=","

# check if watson tracked anything today
if [ -z "$($WATSON report --day --csv)" ]
then
    echo "> no work done on ( $(whoami) ) :: $(date)" >> $LOGFILE
    exit 0
fi

# if we're here, watson did track something
echo "> some work done on this machine today $(date)" >> $LOGFILE

# change into mackenzie dir, log work & push to github
cd $MACKENZIE

git pull

# create yearly named directory to store monthly timesheets
if [ ! -d "$YEAR" ]
then
    mkdir $YEAR
fi

cd $YEAR

# create monthly timesheet if it doesn't exist
if [[ ! -f "${MONTH}.txt" ]]
then 
    touch ${MONTH}.txt && DELIMITER=""
fi

DUMP=$($WATSON report --day --json)

# concatenate JSON to appropriate file
# note: the delimiter is for valid JSON, it's a comma is the file already contains JSON
echo "${DELIMITER}${DUMP}" >> ${MONTH}.txt

# push changes
git add -A
git commit -m "yes sarge"
git push