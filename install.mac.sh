#!/bin/bash
set -e

############################################################################
#################### Manual Installs (outside Homebrew) ####################
############################################################################

# -- Installed manually --
# Clipy
# Amphetamine (keep awake util)
# Appcleaner     # Closed Source. Better to use PearCleaner
# Beekeeper Studio Community
# Google Drive
# Dropover (store) (Paid)
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
# macnotch (Purchased. check emails for license)
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

# -- Paid apps to try --
# CleanMyMac X
# Cork (homebrew GUI interface)
# Little Snitch (Privacy tool to monitor network connections)
# Wipr (ad blocker)
# Lunar (brightness and volume? vcontrol)
# DynamicLake (notch app)
# Klack (mechanical keyboard sound XD 5USD)

# -- Free apps to try --
# Hammerspoon (automation tool)
# Hush Nag Blocker (ad blockers etc)

############################################################################
########################### Tools ##########################################
############################################################################

# Notion CLI
curl -fsSL https://ntn.dev | bash


############################################################################
########################## Homebrew Bootstrap ##############################
############################################################################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


############################################################################
########################## Brew Packages ###################################
############################################################################

# Version managers / runtimes
brew install nvm
brew install pyenv
brew install tfenv
brew install pnpm

# Dev CLI / git
brew install gpg
brew install gh
brew install difftastic
brew install git-delta
brew install git-crypt
brew install git-filter-repo
brew install gitui

# Atlassian CLI
brew tap atlassian/homebrew-acli
brew install acli

# Shell utilities
brew install eza
brew install rg
brew install fzf
brew install tree
brew install jq
brew install htop
brew install glances
brew install btop
brew install bottom
brew install tmux
brew install fd
brew install yazi # File manager TUI (yazi + deps)

# Editors
brew install neovim

# Media
brew install mpv
brew install ffmpeg
brew install yt-dlp

# System / infra
brew install orbstack
# brew install colima
brew install unison
brew install stats
brew install pearcleaner

# Auth / env
brew install bitwarden-cli
brew install direnv

# Apps (cask)
brew install --cask dbeaver-community
brew install --cask applite  # App manager (brew based)
# brew install duckdb
brew install --cask unsecretised/tap/sxitch

# Apps
brew install slack


############################################################################
########################## Language Runtimes / Tools #######################
############################################################################

# Bun
curl -fsSL https://bun.com/install | bash

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Cargo utils
cargo install dye-cli

# Dotnet (disabled)
# sh -c "$(curl -fsSL https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh)"


############################################################################
########################## AI Tools #######################################
############################################################################

# brew install anomalyco/tap/opencode
# brew install gemini-cli

# npm
npm install -g @github/copilot

# brew
brew install codex  # Open AI
# brew install --cask wezterm


# brew cask
brew install --cask claude-code
brew install --cask tolaria  # Memory management tool


# cursor-agent
# curl https://cursor.com/install -fsS | bash

# Pi (Agent harness)
curl -fsSL https://pi.dev/install.sh | sh


############# Experimenting


############################################################################
########################## AI Token Tools #################################
############################################################################

# brew install rtk  # Tokens saver
## Initial setup for rtk
# rtk init -g --codex
# rtk init -g --claude
# rtk init -g --opencode

brew install beads

# pip install "headroom-ai[all]"
uv tool install "headroom-ai[all]"
