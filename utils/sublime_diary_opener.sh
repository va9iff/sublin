diary=~/diary
notes=$diary/notes

year=$(date +%Y)
month=$(date +%B)
month_short=$(date +%b)
day=$(date +%d)

# file for every day
pages_month_folder="$diary/$year/$month"
todays_page_path="$diary/$year/$month/$month $day.txt"

# folder for every day
dumps=$diary/$year/dumps
todays_dump="$dumps/$month $day"

mkdir -p "$pages_month_folder"
mkdir -p "$todays_dump"

subl "$todays_page_path" "$todays_dump" "$diary"