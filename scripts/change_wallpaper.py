#!/usr/bin/python3
import os
import random
import subprocess

user = os.getlogin()
wp_dir = f"/home/{user}/Pictures/Wallpapers"
cur_file = os.path.join(wp_dir, '.current')

imgs = os.listdir(wp_dir)
files = [os.path.join(wp_dir, f) for f in imgs if not f == ".current"]

current_wp = ''
with open(cur_file, 'r') as cf:
    current_wp = cf.readline()
    current_wp = current_wp.replace("\n", "")

if current_wp in files:
    files.remove(current_wp)

if files:
    rnd_idx = random.randint(0, len(files)-1)
    new_wp = files[rnd_idx]

    # check for mode (light or dark)
    mode = "picture-uri-dark"
    subpmode = ["gsettings", "get", "org.gnome.desktop.interface",
                "color-scheme"]
    res = subprocess.Popen(subpmode, stdout=subprocess.PIPE)
    res.wait()
    out, err = res.communicate()
    if "prefer-dark" not in out.decode("utf-8"):
        mode = "picture-uri"

    wp_file = "file://" + new_wp
    subpbackground = ["gsettings", "set", "org.gnome.desktop.background",
                      mode, wp_file]
    subprocess.call(subpbackground)
    subpscreensaver = ["gsettings", "set", "org.gnome.desktop.screensaver",
                       "picture-uri", wp_file]
    subprocess.call(subpscreensaver)

    with open(cur_file, 'w') as cf:
        cf.write(new_wp)
else:
    print("No wallpaper to set")
