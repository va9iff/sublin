import sublime
import sublime_plugin
import subprocess

class RunCommandOnNewWindow(sublime_plugin.EventListener):
    def on_post_window_command(self, window, command_name, args):
        folders = window.folders()
        if folders[0].split('/')[-1] == "notes":
                view = window.active_view()
                # window.set_sidebar_visible(False)
                window.set_tabs_visible(False)
                window.set_status_bar_visible(False)
                window.set_minimap_visible(False)
                view.settings().set('gutter',False)
                # window.settings().set("hide_header",True) # couldn't do it.
                # window.run_command('hide_panel')



    # command_name = ["note_pad_make"]
