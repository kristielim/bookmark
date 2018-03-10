#! /bin/bash
if [ -z "$1" ]
  then
    echo "Possible arguments:"
    # print out all possible arguments
    sed 's/ .*//' bookmark.log | uniq
    exit 1
fi

# replace all instances of the bookmark name with open
# then write to helper script
grep "^$1 " bookmark.log | sed "s/$1/open/" > helper.sh

# execute helper script
chmod +x helper.sh
bash helper.sh