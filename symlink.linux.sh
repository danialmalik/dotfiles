#!/bin/bash

# variables
dotfiles_dir=~/dotfiles/dotfiles
dotfiles_secure_dir=~/dotfiles/secure_dotfiles

# create dirs
# mkdir ~/.config/terminator/

# create symlinks
sudo ln -sf $dotfiles_dir/vimrc ~/.vimrc
sudo ln -sf $dotfiles_dir/bashrc ~/.bashrc
sudo ln -sf $dotfiles_dir/profile ~/.profile
sudo ln -sf $dotfiles_dir/zshrc ~/.zshrc
sudo ln -sf $dotfiles_dir/aliases ~/.bash_aliases
sudo ln -sf $dotfiles_dir/aliases ~/.aliases

#git
sudo ln -sf $dotfiles_dir/gitconfig ~/.gitconfig

# ssh
sudo ln -sf $dotfiles_secure_dir/ssh_config ~/.ssh/config

# hosts
sudo ln -sf $dotfiles_secure_dir/hosts /etc/hosts

# config files

# https://github.com/bulletmark/libinput-gestures
sudo ln -sf ~/dotfiles/config_files/libinput-gestures.conf ~/.config/libinput-gestures.conf

sudo ln -sf $dotfiles_dir/terminator_config ~/.config/terminator/config
