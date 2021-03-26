#!/bin/bash

dconf dump /com/gexperts/Tilix/ > tilix.dconf

if [[ $(echo $XDG_CURRENT_DESKTOP) == *"GNOME"* ]]; then
    dconf dump /org/gnome/ > config_files/gnome.conf
else
    # Export cinnamon settings
    dconf dump /org/cinnamon/ > config_files/cinnamon.conf
fi

git add .
DATE="$(date)"
echo $DATE
git commit -m "$DATE"

git push
