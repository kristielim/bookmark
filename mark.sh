#! /bin/bash

# this script stores currently running applications or open files into bookmark.log
# each line of bookmark.log: <bookmark name> <file to open>

if [ -z "$1" ]
  then
    echo "Pass in the name of the bookmark"
    exit 1
fi

logfile="bookmark.log"

# remove old version of the bookmark if it exists
grep -v "^$1 " $logfile > temp.log && mv temp.log $logfile

# check if Sublime is open
if [ `ps -ax | grep -c Sublime` -gt 1 ]
	then
	echo "$1" -a \"Sublime Text\" >> $logfile
fi

# check if Xcode is open
if [ `ps -ax | grep -c Xcode-beta` -gt 1 ]
	then
	echo "$1" -a Xcode-beta >> $logfile
fi

# check if Preview is open
if [ `ps -ax | grep -c Preview` -gt 1 ]
	then
	# find process id of Preview
	pid=`ps -ax | grep Preview | sed '1!d; 1s/ .*//'` # sed deletes everything but the first line then picks the first word
	# note that the file must be a pdf
	filename=`lsof -p $pid | grep pdf | sed 's/.* //; s/\.pdf.*/.pdf/'` # sed outputs the last word and only what comes before .pdf
	echo "$1" "$filename" >> $logfile
fi

# check if Safari is open
if [ `ps -ax | grep -c Safari.app` -gt 1 ]
	then
	osascript getTabsSafari.scpt $1 >> $logfile
fi

# check if Chrome is open
if [ `ps -ax | grep -c Chrome` -gt 1 ]
	then
	osascript getTabsChrome.scpt $1 >> $logfile
fi

# remove extra new line characters
tr -s '\n' '\n' < $logfile > temp.log && mv temp.log $logfile
