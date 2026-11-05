#!/bin/bash

# variables
DOTFILES_DIR=~/dotfiles/dotfiles
CONFIG_FILES_DIR=$DOTFILES_DIR/config_files
MACOS_CONFIG_FILES_DIR=$CONFIG_FILES_DIR/macos


# Apply common symlinks
$DOTFILES_DIR/symlink.common.sh

################ macOS-only config files

# Herdr app (desktop GUI; macOS-only cask)
mkdir -p $HOME/.config/herdr-app/layouts $HOME/.config/herdr-app/mods
ln -sf $MACOS_CONFIG_FILES_DIR/herdr-app/keys.json $HOME/.config/herdr-app/keys.json
ln -sf $MACOS_CONFIG_FILES_DIR/herdr-app/settings.json $HOME/.config/herdr-app/settings.json
ln -sf $MACOS_CONFIG_FILES_DIR/herdr-app/programs.json $HOME/.config/herdr-app/programs.json
ln -sf $MACOS_CONFIG_FILES_DIR/herdr-app/layouts/personal-main.json $HOME/.config/herdr-app/layouts/personal-main.json
ln -sf $MACOS_CONFIG_FILES_DIR/herdr-app/layouts/main-folders.json $HOME/.config/herdr-app/layouts/main-folders.json
ln -sf $MACOS_CONFIG_FILES_DIR/herdr-app/mods/personal-agents $HOME/.config/herdr-app/mods/personal-agents
ln -sf $MACOS_CONFIG_FILES_DIR/herdr-app/mods/space-folders $HOME/.config/herdr-app/mods/space-folders
