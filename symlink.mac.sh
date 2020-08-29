#!/bin/bash

# variables
dotfiles_dir=~/dotfiles/dotfiles


# create symlinks
ln -sf $dotfiles_dir/vimrc ~/.vimrc
ln -sf $dotfiles_dir/bashrc ~/.bashrc
ln -sf $dotfiles_dir/profile ~/.profile
ln -sf $dotfiles_dir/zshrc ~/.zshrc
ln -sf $dotfiles_dir/aliases ~/.bash_aliases
ln -sf $dotfiles_dir/aliases ~/.aliases

#git
ln -sf $dotfiles_dir/gitconfig ~/.gitconfig

# zsh theme
ln -sf $dotfiles/zsh_theme_powerline10k.zsh ~/.p10k.zsh
