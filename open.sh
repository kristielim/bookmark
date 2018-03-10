#! /bin/bash
if [ -z "$1" ]
  then
    echo "Possible arguments:"
    # print out all possible arguments
    sed 's/ .*//' bookmark.log | uniq
    exit 1
fi

grep $1 bookmark.log | sed "s/$1/open/" > helper.sh
chmod +x helper.sh
./helper.sh