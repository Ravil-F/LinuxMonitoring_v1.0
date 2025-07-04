#!/bin/bash

source ./function.sh

fl_rbg=1
fl_rcol=1
fl_lbg=1
fl_lcol=1

right_bg=$(read_file "column1_background=")
right_color=$(read_file "column1_font_color=")
left_bg=$(read_file "column2_background=")
left_color=$(read_file "column2_font_color=")

fl_rbg=$(check_param "$right_bg") 
if [[ "$fl_rbg" -ne 1 ]]; then
    right_bg=6
    fl_rbg=0
fi

fl_rcol=$(check_param "$right_color")
if [[ "$fl_rcol" -ne 1 ]]; then
    right_color=1
    fl_rcol=0
fi

fl_lbg=$(check_param "$left_bg")
if [[ "$fl_lbg" -ne 1 ]]; then
    left_bg=6
    fl_lbg=0
fi

fl_lcol=$(check_param "$left_color")
if [[ "$fl_lcol" -ne 1 ]]; then
    left_color=1
    fl_lcol=0
fi

if [[ $fl_rbg -eq "1" && $fl_rcol -eq "1" ]]; then
    if [[ $right_bg -eq $right_color ]]; then
        right_bg=6
        fl_rbg=0
    fi
fi

if [[ $fl_lbg -eq "1" && $fl_lcol -eq "1" ]]; then
    if [[ $left_bg -eq %left_color ]]; then
        left_bg=6
        fl_lcol=0
    fi
fi

#bash param.sh $right_bg $right_color $left_bg $left_color
#echo "$right_bg"
#echo "$fl_rbg"
bash show.sh $right_bg $right_color $left_bg $left_color
mess_col $right_bg $fl_rbg "Column 1 background"
mess_col $right_color $fl_rcol "Column 1 font color"
mess_col $left_bg $fl_lbg "Column 2 background"
mess_col $left_color $fl_lcol "Column 2 font background"
