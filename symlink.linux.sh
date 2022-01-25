#!/bin/bash

# variables
DOTFILES_DIR=~/dotfiles/dotfiles
CONFIG_FILES_DIR=$DOTFILES_DIR/config_files
SERVICES_DIR=$DOTFILES_DIR/services

# create dirs
mkdir ~/.config/terminator/ 2>/dev/null
mkdir ~/.config/nvim/ 2>/dev/null

# shell symlinks
ln -sf $CONFIG_FILES_DIR/bashrc ~/.bashrc
ln -sf $CONFIG_FILES_DIR/profile ~/.profile
ln -sf $CONFIG_FILES_DIR/zshrc ~/.zshrc
ln -sf $CONFIG_FILES_DIR/aliases ~/.bash_aliases
ln -sf $CONFIG_FILES_DIR/aliases ~/.aliases

# vim
ln -sf $CONFIG_FILES_DIR/vimrc ~/.vimrc
ln -sf $CONFIG_FILES_DIR/nvim_init.vim ~/.config/nvim/init.vim

#git
ln -sf $CONFIG_FILES_DIR/gitconfig ~/.gitconfig

# config files

# https://github.com/bulletmark/libinput-gestures
ln -sf $CONFIG_FILES_DIR/libinput_gestures/libinput-gestures.conf ~/.config/libinput-gestures.conf

# terminator
ln -sf $CONFIG_FILES_DIR/terminator_config ~/.config/terminator/config

# pwerline10k theme
ln -sf $CONFIG_FILES_DIR/zsh_theme_powerline10k.zsh ~/.p10k.zsh

# MPV media player
mkdir -p ~/.config/mpv
ln -sf $CONFIG_FILES_DIR/mpv/input.conf ~/.config/mpv/input.conf
ln -sf $CONFIG_FILES_DIR/mpv/mpv.conf ~/.config/mpv/mpv.conf

# Systemd services
sudo ln -sf $SERVICES_DIR/battery-charge-threshold.service /etc/systemd/system/battery-charge-threshold.service
