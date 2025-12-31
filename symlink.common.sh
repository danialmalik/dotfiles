#!/bin/bash

# variables
export DOTFILES_DIR=$HOME/dotfiles/dotfiles
export CONFIG_FILES_DIR=$DOTFILES_DIR/config_files
export COMMON_CONFIG_FILES_DIR=$CONFIG_FILES_DIR/common

# create dirs
mkdir $HOME/.config/terminator/ 2>/dev/null
mkdir $HOME/.config/warp-terminal 2>/dev/null
mkdir $HOME/.config/ghostty 2>/dev/null
mkdir $HOME/.config/nvim/ 2>/dev/null

# shell symlinks
ln -sf $COMMON_CONFIG_FILES_DIR/profile $HOME/.profile
ln -sf $COMMON_CONFIG_FILES_DIR/zshrc $HOME/.zshrc
ln -sf $COMMON_CONFIG_FILES_DIR/zshenv $HOME/.zshenv
ln -sf $COMMON_CONFIG_FILES_DIR/aliases $HOME/.aliases

# vim
ln -sf $COMMON_CONFIG_FILES_DIR/vimrc $HOME/.vimrc
ln -sf $COMMON_CONFIG_FILES_DIR/nvim_init.vim $HOME/.config/nvim/init.vim

# git
ln -sf $COMMON_CONFIG_FILES_DIR/gitconfig $HOME/.gitconfig

################ config files

# terminator
ln -sf $COMMON_CONFIG_FILES_DIR/terminator_config $HOME/.config/terminator/config

# Wezterm
ln -sf $COMMON_CONFIG_FILES_DIR/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua

# Warp-terminal
ln -sf $COMMON_CONFIG_FILES_DIR/warp-terminal/keybindings.yaml $HOME/.config/warp-terminal/keybindings.yaml
ln -sf $COMMON_CONFIG_FILES_DIR/warp-terminal/user_preferences.json $HOME/.config/warp-terminal/user_preferences.json

# Ghostly
ln -sf $COMMON_CONFIG_FILES_DIR/ghostty-terminal/config $HOME/.config/ghostty/config

# Zsh Themes
# Directly use from this directory
# ln -sf $COMMON_CONFIG_FILES_DIR/zsh_themes/zsh_theme_powerline10k.zsh $HOME/.p10k.zsh

# MPV media player
mkdir -p $HOME/.config/mpv
ln -sf $COMMON_CONFIG_FILES_DIR/mpv/input.conf $HOME/.config/mpv/input.conf
ln -sf $COMMON_CONFIG_FILES_DIR/mpv/mpv.conf $HOME/.config/mpv/mpv.conf
