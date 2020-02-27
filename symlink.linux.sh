#!/bin/bash

# variables
dotfiles_dir=~/dotfiles


# create dirs
mkdir ~/.config/terminator/

# create symlinks
sudo ln -sf $dotfiles_dir/vimrc ~/.vimrc
sudo ln -sf $dotfiles_dir/bashrc ~/.bashrc
sudo ln -sf $dotfiles_dir/profile ~/.profile
sudo ln -sf $dotfiles_dir/zshrc ~/.zshrc
sudo ln -sf $dotfiles_dir/aliases ~/.bash_aliases
sudo ln -sf $dotfiles_dir/aliases ~/.zsh_aliases

# ssh
sudo ln -sf $dotfiles_dir/ssh_config ~/.ssh/config

# config files

# https://github.com/bulletmark/libinput-gestures
sudo ln -sf ~/dotfiles/config_files/libinput-gestures.conf ~/.config/libinput-gestures.conf

sudo ln -sf $dotfiles_dir/terminator_config ~/.config/terminator/config
