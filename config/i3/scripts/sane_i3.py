#!/usr/bin/env python3
# Shamelessly Stolen from https://gitlab.com/cdutsov/dotfiles/-/raw/master/i3/sane_i3.py

import i3ipc
import subprocess

i3 = i3ipc.Connection()
first_win_id = 0
exceptions = ["zathura"]


def on_window_new(i3, e):
    global exceptions

    if e.container.floating == "user_on":
        print("skipping window: ", e.container.name)
        return
    new_window = i3.get_tree().find_focused()
    windows_on_ws = new_window.workspace()
    windows = [win.name for win in windows_on_ws]
    for exception in exceptions:
        if new_window.name:
            if exception in new_window.name and len(windows) == 1:
                print("skipping window: ", new_window.name)
                return
    global first_win_id
    if len(windows) == 1:
        e.container.command('floating enable')
        e.container.command('move position center')
        first_win_id = e.container.id
    else:
        for win in windows_on_ws:
            if win.name:
                if not win.floating == "user_on":
                    win.command('floating disable')
                win_id = win.id
                if win_id == first_win_id:
                    win.command('floating disable')


def on_window_closed(i3, e):
    global exceptions
    if e.container.floating == "user_on":
        return
    new_window = i3.get_tree().find_focused()
    windows_on_ws = new_window.workspace()
    windows = [win.name for win in windows_on_ws if win.name]
    if len(windows) == 1:
        for win in windows_on_ws:
            # skip exceptions
            for exception in exceptions:
                if win.name:
                    if exception in win.name and len(windows) == 1:
                        print("skipping window: ", win.name)
                        return
            if win.name:
                win.command('floating enable')
                # win.command('move position center')


# Subscribe to events
i3.on('window::close', on_window_closed)
i3.on("window::new", on_window_new)

# Start the main loop and wait for events to come in.
i3.main()
