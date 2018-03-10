#! /bin/bash

# this script opens the bookmarks stored in bookmark.log
# each line of bookmark.log: <bookmark name> <file to open>

# if there is no argument, print out possible arguments
if [ -z "$1" ] || [ $1 = '-h' ]
  then
    echo "Possible arguments:"
    # print out all possible arguments
    sed 's/ .*//' bookmark.log | uniq
    exit 1
fi

# check if argument is found in bookmark.log
if [ `grep -c "^$1 " bookmark.log` -gt 0 ]
	then
	# replace all instances of the bookmark name with open
	# then run in bash
	grep "^$1 " bookmark.log | sed "s/$1/open/" | bash
else
	echo "Bookmark not found"
fi