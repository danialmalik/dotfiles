# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# For rust and cargo
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

# For nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for nodemodules bin
export PATH="$PATH:./node_modules/.bin"

# docker-compose timeout
export COMPOSE_HTTP_TIMEOUT=3000000000

# android sdk tools
export ANDROID_HOME=/home/$USER/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

# the fuck
eval $(thefuck --alias)

# Go lang

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"


# edx devstack
export OPENEDX_RELEASE=ironwood.master
export DEVSTACK_WORKSPACE=/home/danial/work/arbisoft/ucsd/edx/

# alias-tips plugin for zsh
# export ZSH_PLUGINS_ALIAS_TIPS_EXPAND=0
