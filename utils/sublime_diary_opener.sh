top_at=~
top=$top_at/diary

year=$(date +%Y)
month=$(date +%B)
month_short=$(date +%b)
day=$(date +%d)

# everyday shortcut and launching opens the same day's page (a plain text file)
pages_year_folder=$top/$year
pages_month_folder=$pages_year_folder/$month
todays_page_path="$pages_month_folder/$month $day.txt"

# persistant notes folder to structure manually
notes_folder=$top/notes

# folder for every day. can be used to try stuff
dumps_folder="$top/dump/$year/$month"
todays_dump="$dumps_folder/$month_short$day"

mkdir -p "$pages_month_folder"
mkdir -p "$todays_dump"

subl "$todays_page_path" "$todays_dump" "$notes_folder" "$pages_year_folder" "$top/dump"

# subl "~/diary/notes" "$(date +~/diary/%Y/%B)" "$(date +~/diary/%Y/%B/%B\ %d.txt)" "$(date +~/diary/%Y)"