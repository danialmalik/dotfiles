#!/bin/bash
# Mac specific settings here

######### vscode mac #############
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

############### PyENV ######################
# export PYENV_ROOT="$HOME/.pyenv
# export PATH="$PYENV_ROOT/bin:$PATH

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
