#!/bin/bash
set -e

####################### Manually installed
# rcmd
# postman
# meganz
# slack
# wezterm
# hyperkey
# iterm
# rectangle
# vscode
# Obsidian
# Sublime merge

############################################################################
#################### Configurations / variables ############################
############################################################################
USERNAME=danialmalik
DOTFILES=$HOME/dotfiles/dotfiles
CONFIG_FILES_DIR=$DOTFILES/config_files

############################################################################
########################## Pre-processing steps ############################
############################################################################



############################################################################
########################## Install Apps ##################################
############################################################################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Dotnet
sh -c "$(curl -fsSL https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh)"

# Brew packages
brew install gpg
brew install nvm
brew install direnv
brew install orbstack
brew install slack
brew install pyenv
brew install mpv

############# TODOs
# Install
mpv
notion
ticktick
warp-terminal
vim
nvim?
nordvpn

delta for github

#
setup cron jobs
setup syncthing phone backup
setup timemachine backup for mac
