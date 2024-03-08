#!/bin/bash
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

PLUGINS_DIR=$ZSH_CUSTOM/plugins
THEMES_DIR=$ZSH_CUSTOM/themes

mkdir -p $PLUGINS_DIR
mkdir -p $THEMES_DIR

####### Install Plugins
cd $PLUGINS_DIR

git clone https://github.com/djui/alias-tips.git
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zdharma/history-search-multi-word.git

######## Install Themes
cd $THEMES_DIR

git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

git clone https://github.com/romkatv/powerlevel10k --depth=1
