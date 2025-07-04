#!/bin/bash

for param in "$@";
do
    if [[ ! "$param" =~ ^[1-6]$ ]]; then
       echo "parament $param not color"
       exit 1
    fi
done

if [ $1 == $2 ]; then
    echo "Paramenters must be different ($1 == $2). Run the script again"
   exit 1
elif [ $3 == $4 ]; then
    echo "Paramenters must be different ($3 == $4). Run the script again"
    exit 1
fi
bash show.sh "$@"
