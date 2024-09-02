#!/bin/bash

# variables
export DOTFILES_DIR=$HOME/dotfiles/dotfiles
export CONFIG_FILES_DIR=$DOTFILES_DIR/config_files
export LINUX_CONFIG_FILES_DIR=$CONFIG_FILES_DIR/linux
export COMMON_CONFIG_FILES_DIR=$CONFIG_FILES_DIR/common

export SERVICES_DIR=$DOTFILES_DIR/services
export SCRIPTS_DIR=$DOTFILES_DIR/scripts


# Apply common symlinks
$DOTFILES_DIR/symlink.common.sh

# Linux symlinks
ln -sf $LINUX_CONFIG_FILES_DIR/bashrc $HOME/.bashrc
ln -sf $COMMON_CONFIG_FILES_DIR/aliases $HOME/.bash_aliases

# https://github.com/bulletmark/libinput-gestures
# ln -sf $LINUX_CONFIG_FILES_DIR/libinput_gestures/libinput-gestures.conf $HOME/.config/libinput-gestures.conf

# Systemd services
sudo ln -sf $SERVICES_DIR/linux/battery-charge-threshold.service /etc/systemd/system/battery-charge-threshold.service

# Create nemo scripts link
sudo rm -rf $HOME/.local/share/nemo/scripts
ln -sf $SCRIPTS_DIR/linux/nemo/ $HOME/.local/share/nemo/scripts
chmod +x $SCRIPTS_DIR/linux/nemo/*
