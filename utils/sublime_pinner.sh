#!/bin/bash

# ctrl n to open/focus notes
# ctrl m to minimize active window (with window manager)


app_title="~/diary.*Sublime"

# Check if the application is already open
if wmctrl -l | grep "$app_title" > /dev/null; then
    window_id=$(wmctrl -l | grep "$app_title" | cut -d ' ' -f 1)
	# wmctrl -i -r $window_id -b toggle,hidden
    wmctrl -ia "$window_id"
    echo "Application is already open with window ID: $window_id"
else
    echo "Application is not open. Opening the application..."

    # ============
    # diary opener
    # ============
    top=~/diary

    year=$(date +%Y)
    month=$(date +%B)
    day=$(date +%d)

    notes=$top/notes

    year_folder="$top/$year"
    diary="$year_folder/diary" # files for every day
    today_page_path="$diary/$month $day.txt"

    zaps=$year_folder/zaps # folder for every day
    todays_zap="$zaps/$month $day"

    mkdir -p "$top"
    mkdir -p "$year_folder"
    mkdir -p "$diary"
    mkdir -p "$zaps"
    mkdir -p "$todays_zap"
    mkdir -p "$notes"

    subl "$today_page_path" "$todays_zap" "$year_folder" "$notes"
    # =============
    # /diary opener
    # =============
fi
