#!/bin/bash

# 
# 500px-osx-background
# Author: Enrico Cambiaso
# Email: enrico.cambiaso[at]gmail.com
# GitHub project URL: https://github.com/auino/500px-osx-background
# 

# --- --- --- --- ---
# CONFIGURATION BEGIN
# --- --- --- --- ---

# enable the single feed you prefer
# feeds information are available at https://support.500px.com/hc/en-us/articles/204910987-What-RSS-feeds-are-available-

# images of a specific user
USER="auino"
FEED="https://500px.com/$USER/rss"

# popular feed
#FEED="https://500px.com/popular.rss"

# upcoming feed
#FEED="https://500px.com/upcoming.rss"

# fresh feed
#FEED="https://500px.com/fresh.rss"

# editors' choice feed
#FEED="https://500px.com/editors.rss"

# --- --- --- --- ---
#  CONFIGURATION END
# --- --- --- --- ---

# getting feed from 500px
curl -s "$FEED"|grep "<img"|awk -F'src="' '{print $2}'|awk -F'"' '{print $1}' > /tmp/500px_list.txt

# getting elements count
COUNT=`cat /tmp/500px_list.txt|wc -l|awk '{print $1}'`

# getting a random element index
RND=`expr $RANDOM % $COUNT`

# getting the image url from index
IMG=`cat /tmp/500px_list.txt|tail -n +$RND|head -n 1`

# getting image data from url
echo "Downloading image"
curl -s "$IMG" -o /tmp/500px_img.png

# setting image as background
echo "Setting downloaded image as background"
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/tmp/500px_img.png"'
killall Dock
