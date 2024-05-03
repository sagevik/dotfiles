#!/usr/bin/python3
import os
import random
import subprocess
import shutil

user = os.getlogin()
wp_dir = f"/home/{user}/Pictures/Wallpapers"
current_dir = os.path.join(wp_dir, ".current")
wallpaper_file = os.path.join(current_dir, "wallpaper.jpg")
cur_file = os.path.join(current_dir, '.current')

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

    shutil.copy(new_wp, wallpaper_file)
    with open(cur_file, 'w') as cf:
        cf.write(new_wp)

    subpbackground = ["regolith-look", "refresh"]
    subprocess.call(subpbackground)
else:
    print("No wallpaper to set")
