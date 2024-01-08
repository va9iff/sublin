import sublime
import sublime_plugin
import os
from datetime import datetime

class DiaryTodayCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        print("hi")
        year = datetime.now().strftime("%Y")
        month = datetime.now().strftime("%B")
        day = datetime.now().strftime("%d")

        folder_place = os.path.expanduser("~")
        folder_name = "diary"
        file_name = "{month} {day}.txt".format(month=month, day=day)

        folder = os.path.join(folder_place, folder_name, year)
        new_file_path = os.path.join(folder, file_name)
        os.makedirs(folder, exist_ok=True) # make folders if it doesn't exist

        window = self.view.window()
        opened_diary_view = window.open_file(new_file_path)
        if not os.path.exists(new_file_path):
            with open(new_file_path, 'w') as new_file:
                new_file.write("")

        window.run_command("reveal_in_side_bar", { "files": [new_file_path] })
