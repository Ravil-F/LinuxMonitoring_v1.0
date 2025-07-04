#!/bin/bash

echo "HOSTNAME = "$HOSTNAME""
echo "TIMEZONE = $(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')"
echo "USER = "$USER""
echo "OS = $(uname -mrs | awk '{print $1, $2}')"
echo "DATE = $(LC_ALL=C date +"%d %B %Y %H:%M:%S")"
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $(cut -d. -f1 /proc/uptime)"
echo "IP = $(hostname -I)"
echo "MASK = $(ip addr | grep $(hostname -I) | awk '{print $2}' | cut -d '/' -f2 | while read -r prefix; do
        case $prefix in
          8)   echo "255.0.0.0";;
          16)  echo "255.255.0.0";;
          24)  echo "255.255.255.0";;
          32)  echo "255.255.255.255";;
          *)   echo "Unknown mask";;
        esac
         done
   )"
echo "GATEWAY = $(ip r | grep "default" | awk '{print $3}')"
echo "RAM_TOTAL = $(free | grep "Mem:" | awk '{printf "%.3f", $2/1024/1024}') GB"
echo "RAM_USED = $(free | grep "Mem:" | awk '{printf "%.3f", $3/1024/1024}') GB"
echo "RAM_FREE = $(free | grep "Mem:" | awk '{printf "%.3f", $4/1024/1024}') GB"
echo "SPACE_ROOT = $(df | grep "^/" | awk '{printf "%.2f", $2/1024}') MB"
echo "SPACE_ROOT_USED = $(df | grep "^/" | awk '{printf "%.2f", $3/1024}') MB"
echo "SPACE_ROOT_FREE = $(df | grep "^/" | awk '{printf "%.2f", $4/1024}') MB"
