#!/bin/bash
# Mac specific settings here

##### Brew
export PATH="/opt/homebrew/bin:$PATH"

######### vscode mac #############
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

############### PyENV ######################
# export PYENV_ROOT="$HOME/.pyenv
# export PATH="$PYENV_ROOT/bin:$PATH

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi


##### nvm
mkdir -p  ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

###### ZSH


#### Configs

## Terraform

# needed on M* series chips. Without this, `terraform apply` command often gets stuck.
export GODEBUG=asyncpreemptoff=1
