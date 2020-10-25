#!/bin/bash

if [[ $(echo $XDG_CURRENT_DESKTOP) == *"GNOME"* ]]; then
    dconf dump /org/gnome/ > gnome.conf
else
    # Export cinnamon settings
    dconf dump /org/cinnamon/ > cinnamon.conf
fi

git add .
DATE="$(date)"
echo $DATE
git commit -m "$DATE"

git push
