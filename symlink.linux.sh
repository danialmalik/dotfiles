#!/bin/bash

# variables
dotfiles_dir=~/dotfiles/dotfiles
dotfiles_secure_dir=~/dotfiles/secure_dotfiles

# create dirs
mkdir ~/.config/terminator/

# shell symlinks
ln -sf $dotfiles_dir/bashrc ~/.bashrc
ln -sf $dotfiles_dir/profile ~/.profile
ln -sf $dotfiles_dir/zshrc ~/.zshrc
ln -sf $dotfiles_dir/aliases ~/.bash_aliases
ln -sf $dotfiles_dir/aliases ~/.aliases

# vim
ln -sf $dotfiles_dir/vimrc ~/.vimrc

# docker
ln -sf $dotfiles_dir/docker-config.json ~/.docker/config.json

#git
ln -sf $dotfiles_dir/gitconfig ~/.gitconfig

# ssh
ln -sf $dotfiles_secure_dir/ssh_config ~/.ssh/config

# hosts
sudo ln -sf $dotfiles_secure_dir/hosts /etc/hosts

# config files

# https://github.com/bulletmark/libinput-gestures
ln -sf $dotfiles_dir/config_files/libinput-gestures.conf ~/.config/libinput-gestures.conf

# terminator
ln -sf $dotfiles_dir/terminator_config ~/.config/terminator/config
