#!/bin/bash
DOTFILES_DIR=$HOME/dotfiles/dotfiles
CONFIG_FILES_DIR=$DOTFILES_DIR/config_files

if [[ $(echo $XDG_CURRENT_DESKTOP) == *"GNOME"* ]]; then
    dconf dump /org/gnome/ > $CONFIG_FILES_DIR/linux/gnome.conf
else
    # Export cinnamon settings
    dconf dump /org/cinnamon/ > $CONFIG_FILES_DIR/linux/cinnamon.conf
fi

git add .
DATE="$(date)"
echo $DATE
git commit -m "$DATE"

git push
