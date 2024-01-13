#!/bin/bash

app_title="~/diary"
window_id=$(wmctrl -l | grep "$app_title" | cut -d ' ' -f 1)
if wmctrl -l | grep "$app_title" > /dev/null; then
    window_id=$(wmctrl -l | grep "$app_title" | cut -d ' ' -f 1)
	# wmctrl -i -r $window_id -b toggle,hidden

	# focused_window=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')
    # focused_window=$(xprop -root _NET_ACTIVE_WINDOW)
    # focused_window=$(wmctrl -l | grep "$(wmctrl -d | awk '{print $1}')" | awk '{print $1}')
    # focused_window=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) _NET_WM_NAME)
    # focused_window=$(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f2)
    focused_window_details=$(wmctrl -lp | grep $(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | \
    awk '{print $5}' | sed 's/,//' | sed 's/^0x/0x0/')
)
    focused_window=$(echo "$focused_window_details" | awk '{print $1}')




	echo $focused_window
	echo $window_id
	if [ "$focused_window" == "$window_id" ]; then
		echo "focused on $focused_window"
	    # If focused, hide the window
	    wmctrl -i -r "$window_id" -b toggle,hidden
	else
        echo "not in focus"
	    # If not focused, focus the window
	    wmctrl -i -a "$window_id"
	fi





    # wmctrl -ia "$window_id"
    echo "Application is already open with window ID: $window_id"
else
    echo "Application is not open. Opening the application..."

    ~/.config/sublime-text/Packages/sublin/utils/sublime_diary_opener.sh
    # /home/va9iff/v9/utils/mycom # to undecorate
fi
