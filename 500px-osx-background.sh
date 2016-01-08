#!/bin/bash

USER='auino'

# getting feed from 500px
curl -s "https://500px.com/$USER/rss"|grep "<img"|awk -F'src="' '{print $2}'|awk -F'"' '{print $1}' > /tmp/500px_list.txt

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
