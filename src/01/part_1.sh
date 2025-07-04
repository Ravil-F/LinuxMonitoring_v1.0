#!/bin/bash
#
text=$1
if [[ "$text" =~ ^[a-zA-Z]+$ ]]; then
    echo "$text"
else
    echo "Parametr not text"
fi
