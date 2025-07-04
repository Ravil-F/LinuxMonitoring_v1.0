#!/bin/bash

function color_meaning {
    case "$1" in
        1) echo 37;;
        2) echo 31;;
        3) echo 32;;
        4) echo 34;;
        5) echo 35;;
        6) echo 30;;
        *) echo "Unknow color";;
    esac
}

function set_color {
    local tmp_rbg=$(color_meaning $1)
    local tmp_rcolor=$(color_meaning $2)
    local tmp_lbg=$(color_meaning $3)
    local tmp_lcolor=$(color_meaning $4)


    local right_bg=$((10 + $tmp_rbg))
    local right_color=$tmp_rcolor
    local left_bg=$((10 + $tmp_lbg))
    local left_color=$tmp_lcolor

    echo -e "\e[${right_bg};${right_color}m$5\e[0m = \e[${left_bg};${left_color}m$6\e[0m"
}
