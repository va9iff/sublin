import sublime
import sublime_plugin
import os
from datetime import datetime

class NoteCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        view = self.view.window().open_file(os.path.expanduser("~./note.txt"))
