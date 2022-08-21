#!/bin/bash
YEARMONTH=$(date +"%Y-%m")
SECOND=$(date +"%s")

cd $HOME/bin/mackenzie

git pull

# create log file if it doesn't exit
if [[ ! -f "${YEARMONTH}.txt" ]]
then 
    touch ${YEARMONTH}.txt && echo "> today's log file created"
fi

# add to file
echo "Another line ${SECOND}" >> ${YEARMONTH}.txt

git add -A
git commit -m "yes sarge"
git push