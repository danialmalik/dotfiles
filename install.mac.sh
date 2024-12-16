#!/bin/bash
set -e

####################### Manually installed
# Clipy
# amphetiamine (keep awake util)
#
# Amphetamine
# Appcleaner
# Beekeeper studio Community
# Google Drive
# Dropover (store) (Paid)
# Dropshelf
# Hidden bar
# Bartender 5
# hyperkey
# iterm
# lightshot
# Latest
# Brave
# Arc
# meganz
# Notion
# Obsidian
# postman
# raycast
# rcmd (store)
# rectangle (store)
# shottr
# slack
# NordVPN
# Maccy
# Keyboard clean tool
# libre office
# TickTick
# Sublime merge
# Karabinar elements
# Suspicious Package (to check .pkg files)
# GrandPerspective (storage analyzer)
# vscode
# wezterm
# AltTab (window switcher)
# Syncthing
# Breaktimer
# Whatsapp
# spotify
# CrossOver (Wine) (10usd per year)



######## Paid apps to be tried yet

# Swish (window management using gestures)
# CleanMyMac X
# Cleanshot X (SS tool)
# Cork (homebrew GUI interface)
# DaisyDisk (Disk usage cleanup)
# Little Snitch (Privacy tool to monitor network connections)
# Wipr (ad blocker)
# Lunar (brightness and volume? vcontrol)

# Klack (mechanical keyboard sound XD 5USD)

############# Free Apps to try
# Hammerspoon (automation tool)
# Hush Nag Blocker (ad blockers etc)

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
brew install bitwarden-cli
brew install nvm
brew install eza
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

# ############ Cargo utils
# cargo install exa

############# TODOs

#
# setup syncthing phone backup
# setup timemachine backup for mac
