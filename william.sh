#!/bin/bash
YEARMONTH=$(date +"%Y-%m")
DELIMITER=","

cd $HOME/bin/mackenzie

git pull

# create log file if it doesn't exit
if [[ ! -f "${YEARMONTH}.txt" ]]
then 
    touch ${YEARMONTH}.txt && echo "> today's log file created" && DELIMITER=""
fi

DUMP=$(watson report --day --json)

# add to file
echo "${DELIMITER}${DUMP}" >> ${YEARMONTH}.txt

git add -A
git commit -m "yes sarge"
git push