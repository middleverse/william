# William: A Productivity Tracking Cron

**william** is a daily chron that aggregates [watson](https://tailordev.github.io/Watson/) tracking data from dev machines configured for the task, and pushes to github on days worked.

If you'd like to read about William's architecture & how to build one for your own, you can do so [here](https://middleverse.dev/blog/1-building-a-semi-automated-productivity-tracking-bot-for-macos-linux).

## Pre-Installation

### Install Watson

Make sure to have [watson](https://tailordev.github.io/Watson/) installed.

### Create A Logging Repo

1. Create a separate GitHub repo for logs.
2. Clone the repo on to the dev machine(s). 
3. Give the absolute path to this repo to the installation below.

## Installation

- `bash init.sh`
- The above command installs the script in `$HOME/bin/william/` with the full script path as `$HOME/bin/william/william.sh`.

## Post-Installation

You may delete this repo, the script is installed on your machine.
