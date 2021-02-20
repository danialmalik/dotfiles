#!/bin/bash

# variables
dotfiles_dir=~/dotfiles/dotfiles
config_files_dir=$dotfiles_dir/config_files


# create symlinks
ln -sf $config_files_dir/vimrc ~/.vimrc
ln -sf $config_files_dir/bashrc ~/.bashrc
ln -sf $config_files_dir/profile ~/.profile
ln -sf $config_files_dir/zshrc ~/.zshrc
ln -sf $config_files_dir/aliases ~/.bash_aliases
ln -sf $config_files_dir/aliases ~/.aliases

#git
ln -sf $config_files_dir/gitconfig ~/.gitconfig

# zsh theme
ln -sf $config_files_dir/zsh_theme_powerline10k.zsh ~/.p10k.zsh
