#!/bin/bash

bash show.sh
echo -n "Save system information  Y(y): "
read tmp

if [[ "$tmp" =~ ^[Yy]$ ]]; then
    bash save.sh
else echo "Not save system information"
fi

