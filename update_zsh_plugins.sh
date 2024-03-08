#!/bin/bash
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

PLUGINS_DIR=$ZSH_CUSTOM/plugins
THEMES_DIR=$ZSH_CUSTOM/themes

####### Install Plugins
cd $PLUGINS_DIR

git -C $PLUGINS_DIR/alias-tips pull
git -C $PLUGINS_DIR zsh-autosuggestions
git -C $PLUGINS_DIR zsh-syntax-highlighting
git -C $PLUGINS_DIR history-search-multi-word

######## Install Themes
cd $THEMES_DIR

git -C spaceship-prompt pull
git -C powerlevel10k pull
