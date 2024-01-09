top_at=~
top=$top_at/diary

year=$(date +%Y)
month=$(date +%B)
day=$(date +%d)

# everyday shortcut and launching opens the same day's page (a plain text file)
pages_year_folder=$top/$year
pages_month_folder=$pages_year_folder/$month
todays_page_path="$pages_month_folder/$month $day.txt"

# persistant notes folder to structure manually
notes_folder=$top/notes

# folder for every day. can be used to try stuff
dumps_folder="$top/dumps/$year/$month"
todays_dump="$dumps_folder/$month $day dump"

mkdir -p "$pages_month_folder"
mkdir -p "$dumps_folder"

subl "$todays_page_path" "$todays_dump" "$notes_folder" "$pages_year_folder"

# subl "~/diary/notes" "$(date +~/diary/%Y/%B)" "$(date +~/diary/%Y/%B/%B\ %d.txt)" "$(date +~/diary/%Y)"