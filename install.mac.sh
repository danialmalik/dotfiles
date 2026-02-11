#!/bin/bash
set -e

####################### Manually installed
# Clipy
# amphetiamine (keep awake util)
#
# Amphetamine
# Appcleaner     # Closed Source. Better to use PearCleaner
# Beekeeper studio Community
# Google Drive
# Dropover (store) (Paid)
# Dropshelf
# DaisyDisk # (Paid, Purchased) # Disk usage analyzer
# Hidden bar
# Bartender 5   # Use ICE (OpenSource alternative)
# hyperkey
# Cmd+X
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
# Swish (window management using gestures)
# Keyboard clean tool
# KnockKnock? # Tool to check what apps start at startup.
# libre office
# TickTick
# Sublime merge
# Karabinar elements
# Suspicious Package (to check .pkg files)
# GrandPerspective (storage analyzer)
# vscode
# AltTab (window switcher)
# Syncthing
# Breaktimer
# Whatsapp
# spotify
# CrossOver (Wine) (10usd per year) || Whisky (Free Alternative)


######## Paid apps to be tried yet

# CleanMyMac X
# Cork (homebrew GUI interface)
# Little Snitch (Privacy tool to monitor network connections)
# Wipr (ad blocker)
# Lunar (brightness and volume? vcontrol)
# DynamicLake (notch app)

# Klack (mechanical keyboard sound XD 5USD)

############# Free Apps to try
# Hammerspoon (automation tool)
# Hush Nag Blocker (ad blockers etc)

############################################################################
#################### Configurations / variables ############################
############################################################################


############################################################################
########################## Pre-processing steps ############################
############################################################################



############################################################################
########################## Install Apps ##################################
############################################################################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Dotnet
# sh -c "$(curl -fsSL https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh)"

# Brew packages
brew install gpg
brew install gh
brew install bitwarden-cli
brew install nvm
brew install eza
brew install direnv
brew install orbstack
brew install slack
brew install pyenv
brew install tfenv
brew install difftastic
brew install mpv
brew install tree
brew install unison
brew install jq
brew install git-delta
brew install gitui
brew install stats
brew install pearcleaner
brew install rg
brew install ffmpeg
brew install yt-dlp
brew install --cask dbeaver-community
brew install pnpm

# Atlassian CLI
brew tap atlassian/homebrew-acli
brew install acli


# brew install --cask wezterm

############## RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


########## AI Tools
brew install sst/tap/opencode
npm install -g @github/copilot
brew install codex # Open AI
brew install --cask claude-code
# brew install gemini-cli

## cursor-agent
# curl https://cursor.com/install -fsS | bash
