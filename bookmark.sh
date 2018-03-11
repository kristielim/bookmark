#! /bin/bash

# this script stores currently running applications or open files into bookmark.log
# each line of bookmark.log: <bookmark name> <file to open>

if [ -z "$1" ]
  then
    echo "Pass in the name of the bookmark"
    exit 1
fi

# check if Sublime is open
if [ `ps -ax | grep -c Sublime` -gt 1 ]
	then
	echo "$1" -a \"Sublime Text\" >> bookmark.log
fi

# check if Xcode is open
if [ `ps -ax | grep -c Xcode-beta` -gt 1 ]
	then
	echo "$1" -a Xcode-beta >> bookmark.log
fi

# check if Preview is open
if [ `ps -ax | grep -c Preview` -gt 1 ]
	then
	# find process id of Preview
	pid=`ps -ax | grep Preview | sed '1!d; 1s/ .*//'`
	# note that the file must be within the Documents folder
	filename=`lsof -p $pid | grep Documents | sed 's/.* //'`
	echo "$1" "$filename" >> bookmark.log
fi

# check if Safari is open
if [ `ps -ax | grep -c Safari` -gt 1 ]
	then
	osascript getTabsSafari.scpt $1 >> bookmark.log
fi

# check if Chrome is open
if [ `ps -ax | grep -c Chrome` -gt 1 ]
	then
	osascript getTabsChrome.scpt $1 >> bookmark.log
fi


