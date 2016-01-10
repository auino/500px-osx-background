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

# set to 0 if you want to use (also) portrait photos as background
ONLY_LANDSCAPE_MODE=1

# specify feed source type; available options: user, search, popular, upcoming, fresh, editors
SRC_TYPE="search"

# needles
NEEDLE_TAG="<img"
NEEDLE_SRC_ATTR="src"

# enable the single feed you prefer
# feeds information are available at https://support.500px.com/hc/en-us/articles/204910987-What-RSS-feeds-are-available-

# images of a specific user
if [ "$SRC_TYPE" == "user" ]; then
	USER="auino"
	FEED="https://500px.com/$USER/rss"
fi

# images from a search
if [ "$SRC_TYPE" == "search" ]; then
	SEARCH_QUERY="cat"
	CATEGORIES="Animals"
	SORT="newest"
	FEED="https://500px.com/search.rss?q=${SEARCH_QUERY}&type=photos&categories=${CATEGORIES}&sort=${SORT}"
	NEEDLE_TAG="<media:content"
	NEEDLE_SRC_ATTR="url"
fi

# popular feed
if [ "$SRC_TYPE" == "popular" ]; then
	FEED="https://500px.com/popular.rss"
fi

# upcoming feed
if [ "$SRC_TYPE" == "upcoming" ]; then
	FEED="https://500px.com/upcoming.rss"
fi

# fresh feed
if [ "$SRC_TYPE" == "fresh" ]; then
	FEED="https://500px.com/fresh.rss"
fi

# editors' choice feed
if [ "$SRC_TYPE" == "editors" ]; then
	FEED="https://500px.com/editors.rss"
fi

# --- --- --- --- ---
#  CONFIGURATION END
# --- --- --- --- ---

# getting feed from 500px
curl -s "$FEED"|grep "$NEEDLE_TAG"|awk -F$NEEDLE_SRC_ATTR'=\"' '{print $2}'|awk -F'"' '{print $1}' > /tmp/500px_list.txt

# getting elements count
COUNT=`cat /tmp/500px_list.txt|wc -l|awk '{print $1}'`

# cycling until a "good" image if found
FOUND=0
for i in $(seq 1 $COUNT); do
	# printing basic information
	echo "Getting image"

	# getting a random element index
	RND=`expr $RANDOM % $COUNT`

	# getting the image url from index
	IMG=`cat /tmp/500px_list.txt|tail -n +$RND|head -n 1`

	# getting image data from url
	curl -s "$IMG" -o /tmp/500px_img.png

	# getting image dimensions
	IMG_W=`sips -g pixelWidth /tmp/500px_img.png|tail -n 1|awk '{print $2}'`
	IMG_H=`sips -g pixelHeight /tmp/500px_img.png|tail -n 1|awk '{print $2}'`
	echo "Image size is ${IMG_W} x ${IMG_H}"

	# checking if image is "good"
	if [ ! $ONLY_LANDSCAPE_MODE ] || [ $IMG_W -gt $IMG_H ]; then
		FOUND=1
		break
	fi
done

if [ $FOUND ]; then
	# setting image as background
	echo "Setting downloaded image as background"
	osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/tmp/500px_img.png"'
	killall Dock
else
	echo "No image found"
fi
