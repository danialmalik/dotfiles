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

################ bun ###################
# bun completions
[ -s "/Users/danialmalik/.bun/_bun" ] && source "/Users/danialmalik/.bun/_bun"


######### LM Studio CLI #############
if command -v lms >/dev/null 2>&1; then
	export PATH="$PATH:/Users/danialmalik/.lmstudio/bin"
fi


##### nvm
mkdir -p  ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

### Sublime text

[ -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin" ] && export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

########## bun

# bun completions
[ -s "/Users/danialmalik/.bun/_bun" ] && source "/Users/danialmalik/.bun/_bun"


### libpq (pg_dump and pg_restore etc)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

##### Herdr session restore (Revive: ai-space/herdr/app/mods/revive)
# Codex must run without its shared daemon so its hooks stay tied to the terminal.
codex() { command codex --no-daemon "$@"; }

# >>> herdr-revive >>>
# Resume the coding agent a herdr terminal lost to a restart or reboot.
# REVIVE_DEBUG=1 says why it did or didn't.
if [ -n "$HC_TERMINAL_ID" ] && [ -f /Users/danialmalik/dotfiles/ai-space/herdr/app/mods/revive/revive.mjs ] && command -v node >/dev/null 2>&1; then
  __revive_j="$("${REVIVE_HC:-hc}" get "$HC_TERMINAL_ID" --json 2>/dev/null)"
  case "$__revive_j" in *'"revive.session"'*) __revive_has=1 ;; *) __revive_has= ;; esac
  case "$__revive_j" in *'"pid":'"$$"','*|*'"pid": '"$$"','*) __revive_own=1 ;; *) __revive_own= ;; esac
  if [ -z "$__revive_has" ]; then
    if [ -n "$REVIVE_DEBUG" ]; then echo "revive: nothing remembered on $HC_TERMINAL_ID" >&2; fi
  elif [ -z "$__revive_own" ]; then
    if [ -n "$REVIVE_DEBUG" ]; then echo "revive: not the terminal's own shell" >&2; fi
  else
    if [ -n "$REVIVE_DEBUG" ]; then __revive="$(node /Users/danialmalik/dotfiles/ai-space/herdr/app/mods/revive/revive.mjs check --shell $$)"
    else __revive="$(node /Users/danialmalik/dotfiles/ai-space/herdr/app/mods/revive/revive.mjs check --shell $$ 2>/dev/null)"; fi
    if [ -z "$__revive" ]; then unset __revive
    elif [ -n "$ZSH_VERSION" ]; then
      __revive_run() { add-zsh-hook -d precmd __revive_run; eval "$__revive"; unset __revive; unfunction __revive_run; }
      autoload -Uz add-zsh-hook && add-zsh-hook precmd __revive_run
    elif [ -n "$BASH_VERSION" ]; then
      __revive_run() { PROMPT_COMMAND="${PROMPT_COMMAND#__revive_run;}"; eval "$__revive"; unset __revive; unset -f __revive_run; }
      PROMPT_COMMAND="__revive_run;${PROMPT_COMMAND}"
    else eval "$__revive"; unset __revive; fi
  fi
  unset __revive_j __revive_has __revive_own
fi
# <<< herdr-revive <<<

###### ZSH


#### Configs

## Terraform

# needed on M* series chips. Without this, `terraform apply` command often gets stuck.
export GODEBUG=asyncpreemptoff=1
