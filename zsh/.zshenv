# General config
export HISTSIZE=10000
export SAVEHIST=10000

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.local/cache"

# Editor
export EDITOR="vim"
export VISUAL="$EDITOR"
export VIMINIT="source ${XDG_CONFIG_HOME}/vim/config"

# Path
export PATH="$HOME/.local/bin:$PATH"

# Git
export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config"

# External tools
export NVM_DIR="/Users/noah-pragin-clearscale/.nvm"
