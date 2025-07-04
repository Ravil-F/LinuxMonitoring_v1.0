#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "No parametr"
    exit 1
fi

if [[ "$1" != */ ]]; then
    echo "Not '/'"
    exit 1
fi

if [[ -d "$1" ]]; then
    START_TIME=$(date +%s)
    bash show.sh $1 $START_TIME
else
    echo "No path"
fi
