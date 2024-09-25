#!/bin/bash
set -e

####################### Manually installed
# Clipy
# amphetiamine (keep awake util)
#
# Dropover (store) (Paid)
# Dropshelf
# Hidden bar
# hyperkey
# iterm
# lightshot
# meganz
# Obsidian
# postman
# raycast
# rcmd (store)
# rectangle (store)
# shottr
# slack
# Sublime merge
# Suspicious Package (to check .pkg files)
# vscode
# wezterm


######## Paid apps to be tried yet

# Swish (window management using gestures)
# CleanMyMac X
# Cleanshot X (SS tool)
# Cork (homebrew GUI interface)
# DaisyDisk (Disk usage cleanup)

# Klack (mechanical keyboard sound XD 5USD)

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
brew install tree
brew install unison
brew install jq
brew install git-delta
brew install gitui
brew install stats

############## RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

############ Cargo utils
cargo install exa

############# TODOs
# Install
mpv
warp-terminal
nvim?
nordvpn

delta for github

#
# setup syncthing phone backup
# setup timemachine backup for mac
