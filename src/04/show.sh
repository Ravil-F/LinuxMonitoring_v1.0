#!/bin/bash

#sudo apt install net-tools --- for ifconfig
# 1-whire 2-red 3-green 4-blue 5-purple 6-black
. ./function.sh

set_color $@ "HOSTNAME" $HOSTNAME
set_color $@ "TIMEZONE" $(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')
set_color $@ "USER" $USER
set_color $@ "OS" "$(uname -mrs | awk '{print $1, $2}')"
set_color $@ "DATE" "$(LC_ALL=C date +"%d %B %Y %H:%M:%S")"
set_color $@ "UPTIME" "$(uptime -p)"
set_color $@ "UPTIME_SEC" "$(cut -d. -f1 /proc/uptime)"
set_color $@ "IP" "$(hostname -I)"
set_color $@ "MASK" "$(ip addr | grep $(hostname -I) | awk '{print $2}' | cut -d '/' -f2 | while read -r prefix; do
    case $prefix in
        8)   echo "255.0.0.0";;
        16)  echo "255.255.0.0";;
        24)  echo "255.255.255.0";;
        32)  echo "255.255.255.255";;
        *)   echo "Unknown mask";;
    esac
done
)"
set_color $@ "GATEWAY" "$(ip r | grep "default" | awk '{print $3}')"
set_color $@ "RAM_TOTAL" "$(free | grep "Mem:" | awk '{printf "%.3f", $2/1024/1024}') GB"
set_color $@ "RAM_USED" "$(free | grep "Mem:" | awk '{printf "%.3f", $3/1024/1024}') GB"
set_color $@ "RAM_FREE" "$(free | grep "Mem:" | awk '{printf "%.3f", $4/1024/1024}') GB"
set_color $@ "SPACE_ROOT" "$(df | grep "^/" | awk '{printf "%.2f", $2/1024}') MB"
set_color $@ "SPACE_ROOT_USED" "$(df | grep "^/" | awk '{printf "%.2f", $3/1024}') MB"
set_color $@ "SPACE_ROOT_FREE" "$(df | grep "^/" | awk '{printf "%.2f", $4/1024}') MB"
