#!/bin/bash

# Export cinnamon settings
dconf dump /org/cinnamon/ > cinnamon.conf
# dconf dump /org/gnome/ > gnome.conf

git add .
DATE="$(date)"
echo $DATE
git commit -m "$DATE"

git push
