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
	ps -ax | grep Preview | cut -d ' ' -f 1 >> bookmark.log
fi




