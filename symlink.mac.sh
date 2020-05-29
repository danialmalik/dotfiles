#!/bin/bash

# variables
dotfiles_dir=~/dotfiles


# create symlinks
sudo ln -sf $dotfiles_dir/vimrc ~/.vimrc
sudo ln -sf $dotfiles_dir/bashrc ~/.bashrc
sudo ln -sf $dotfiles_dir/profile ~/.profile
sudo ln -sf $dotfiles_dir/zshrc ~/.zshrc
sudo ln -sf $dotfiles_dir/aliases ~/.bash_aliases
sudo ln -sf $dotfiles_dir/aliases ~/.aliases

# ssh
sudo ln -sf $dotfiles_dir/ssh_config ~/.ssh/config

# hosts
sudo ln -sf $dotfiles_dir/hosts /etc/hosts

# zsh theme
sudo ln -sf $dotfiles/zsh_theme_powerline10k.zsh ~/.p10k.zsh
