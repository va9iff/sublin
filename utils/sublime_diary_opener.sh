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