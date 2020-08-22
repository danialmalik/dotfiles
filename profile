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

## zsh settings
# disable auto correct
unsetopt correct_all
unsetopt correct

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"


# For nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# for nodemodules bin
export PATH="$PATH:./node_modules/.bin"


# docker-compose timeout
export COMPOSE_HTTP_TIMEOUT=3000000000


# the fuck
eval $(thefuck --alias)


# Go lang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"


# edx devstack
# export OPENEDX_RELEASE=ironwood.master


# alias-tips plugin for zsh
# export ZSH_PLUGINS_ALIAS_TIPS_EXPAND=0

# for pipenv
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Load the system specific profile variables
SYSTEM=$(uname -s)

if [ "$SYSTEM" = "Linux" ]; then
	# Linux specific settings here

	# For rust and cargo
	source $HOME/.cargo/env
	export PATH="$HOME/.cargo/bin:$PATH"
	export PATH="$PATH:/usr/local/go/bin"

	# android sdk tools
	export ANDROID_HOME=$HOME/Android/sdk
	export PATH=$ANDROID_HOME/platform-tools:$PATH
	export PATH=$ANDROID_HOME/tools:$PATH

	# pyenv
	export PATH="/home/danialmalik/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"

else # MacOS
	# Mac specific settings here

	######### vscode mac #############
	export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

	########### mysql_mac ##############
	export PATH=$PATH:/usr/local/mysql/bin

	############# zsh theme ####################
	# have to source oh-my-zsh.sh if theme is changed in this file
	# https://github.com/denysdovhan/spaceship-prompt
	# ZSH_THEME="powerlevel10k/powerlevel10k"
	# source $ZSH/oh-my-zsh.sh

	# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

	########### Android SDK #####################
	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$PATH:$ANDROID_HOME/emulator
	export PATH=$PATH:$ANDROID_HOME/platform-tools
	export PATH=$PATH:$ANDROID_HOME/tools
	export PATH=$PATH:$ANDROID_HOME/tools/bin

	############### PyENV ######################
	# export PYENV_ROOT="$HOME/.pyenv
	# export PATH="$PYENV_ROOT/bin:$PATH

	if command -v pyenv 1>/dev/null 2>&1; then
		eval "$(pyenv init -)"
	fi

fi
