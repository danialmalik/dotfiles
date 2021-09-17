#!/bin/bash

# variables
dotfiles_dir=~/dotfiles/dotfiles
config_files_dir=$dotfiles_dir/config_files

# create dirs
mkdir ~/.config/terminator/ 2>/dev/null
mkdir ~/.config/nvim/ 2>/dev/null

# shell symlinks
ln -sf $config_files_dir/bashrc ~/.bashrc
ln -sf $config_files_dir/profile ~/.profile
ln -sf $config_files_dir/zshrc ~/.zshrc
ln -sf $config_files_dir/aliases ~/.bash_aliases
ln -sf $config_files_dir/aliases ~/.aliases

# vim
ln -sf $config_files_dir/vimrc ~/.vimrc
ln -sf $config_files_dir/nvim_init.vim ~/.config/nvim/init.vim

#git
ln -sf $config_files_dir/gitconfig ~/.gitconfig

# config files

# https://github.com/bulletmark/libinput-gestures
ln -sf $config_files_dir/config_files/libinput_gestures/libinput-gestures.conf ~/.config/libinput-gestures.conf

# terminator
ln -sf $config_files_dir/terminator_config ~/.config/terminator/config

# pwerline10k theme
ln -sf $config_files_dir/zsh_theme_powerline10k.zsh ~/.p10k.zsh

# MPV media player
mkdir -p ~/.config/mpv
ln -sf $config_files_dir/config_files/mpv/input.conf ~/.config/mpv/input.conf
ln -sf $config_files_dir/config_files/mpv/mpv.conf ~/.config/mpv/mpv.conf
