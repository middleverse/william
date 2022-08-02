# William: A Productivity Tracking Cron

**william** is a daily chron that aggregates [watson](https://tailordev.github.io/Watson/) tracking data from dev machines configured for the task, and pushes to github on days worked.

## Pre-Installation

### Install Watson

Make sure to have [watson](https://tailordev.github.io/Watson/) installed.

### Create Log Repo

1. Create a separate GitHub repo for logs.
2. Clone the repo on to the dev machine(s). 
3. Give the absolute path to this repo to the installation below.

## Installation

`bash init.sh`

The above command installs the script in `/usr/local/bin/` with the full script path as `/usr/local/bin/william.sh`.

## Post-Installation

You may delete this repo, the script is installed on your machine.
