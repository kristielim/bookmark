#! /bin/bash
# if there is no argument, print out possible arguments
if [ -z "$1" ]
  then
    echo "Possible arguments:"
    # print out all possible arguments
    sed 's/ .*//' bookmark.log | uniq
    exit 1
fi

# replace all instances of the bookmark name with open
# then run in bash
grep "^$1 " bookmark.log | sed "s/$1/open/" | bash