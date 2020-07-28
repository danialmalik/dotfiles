#!/bin/bash

# variables
dotfiles_dir=~/dotfiles/dotfiles


# create symlinks
sudo ln -sf $dotfiles_dir/vimrc ~/.vimrc
sudo ln -sf $dotfiles_dir/bashrc ~/.bashrc
sudo ln -sf $dotfiles_dir/profile ~/.profile
sudo ln -sf $dotfiles_dir/zshrc ~/.zshrc
sudo ln -sf $dotfiles_dir/aliases ~/.bash_aliases
sudo ln -sf $dotfiles_dir/aliases ~/.aliases

# zsh theme
sudo ln -sf $dotfiles/zsh_theme_powerline10k.zsh ~/.p10k.zsh
