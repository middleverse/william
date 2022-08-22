#!/bin/bash

YEARMONTH=$(date +"%Y-%m")
DELIMITER=","
IS_EMPTY=$(watson report --day --csv)

# check if watson tracked anything today
if [ -z "${IS_EMPTY}" ]
then
    echo "> no work done on this machine today"
    exit 0
fi

# if we're here, watson did track something
# change into macenzie dir, log work & push to github
cd $HOME/bin/mackenzie

git pull

# create log file if it doesn't exit
if [[ ! -f "${YEARMONTH}.txt" ]]
then 
    touch ${YEARMONTH}.txt && echo "> today's log file created" && DELIMITER=""
fi

DUMP=$(watson report --day --json)

# concatenate JSON to appropriate file
# note: the delimiter is for valid JSON, it's a comma is the file already contains JSON
echo "${DELIMITER}${DUMP}" >> ${YEARMONTH}.txt

# push changes
git add -A
git commit -m "yes sarge"
git push