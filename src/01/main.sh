#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Not parametr"
    exit 1
else
    bash part_1.sh "$1"
fi

