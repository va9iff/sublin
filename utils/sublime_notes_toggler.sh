#!/bin/bash

app_title="(notes) - Sublime Text"
launch_app="~/.config/sublime-text/Packages/sublin/utils/sublime_notes_opener.sh"

window_id=$(wmctrl -l | grep "$app_title" | cut -d ' ' -f 1)
if wmctrl -l | grep "$app_title" > /dev/null; then
    window_id=$(wmctrl -l | grep "$app_title" | cut -d ' ' -f 1)
    focused_window_details=$(
    wmctrl -lp | grep $(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | \
    awk '{print $5}' | sed 's/,//' | sed 's/^0x/0x0/'))
    focused_window=$(echo "$focused_window_details" | awk '{print $1}')

	echo "win already open with ID: $window_id"
	echo "currently focused win ID: $focused_window"

	if [ "$focused_window" == "$window_id" ]; then
		echo "already in focus - hiding"
	    wmctrl -i -r "$window_id" -b toggle,hidden
	else
        echo "not in focus - focusing"
	    wmctrl -i -a "$window_id"
	fi

else
    echo "no open window found - launching"
    eval $launch_app
    # /home/va9iff/v9/utils/mycom # to undecorate (BUT THE ACTIVE WINDOW)
fi
