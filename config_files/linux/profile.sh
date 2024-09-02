#!/bin/bash
# Linux specific settings here


# For info
source /etc/os-release

# For rust and cargo
source $HOME/.cargo/env

# go
export PATH=$PATH:/usr/local/go/bin

# android sdk tools
export ANDROID_HOME=$HOME/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

# pyenv
export PATH=$HOME/.pyenv/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# only for gnome
# to show snap apps in overview
export XDG_DATA_DIRS="${XDG_DATA_DIRS}:/var/lib/snapd/desktop"

# Dotnet
export PATH=$HOME/.dotnet/tools:$PATH
export PATH=$HOME/.dotnet:$PATH
export DOTNET_ROOT=$HOME/.dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Homebrew (Linux)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export HOMEBREW_NO_ANALYTICS=1

# AppImages
export PATH=$PATH:$HOME/progs/app-images

###################################################################
####################### Last steps ############################
###################################################################

#### Source scripts
source $DOTFILES_DIR/scripts/utils/linux/helpers.sh
