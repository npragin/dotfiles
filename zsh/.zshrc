##################
# External Tools #
##################
export PATH="$(npm prefix -g)/bin:$PATH"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

###############
# zsh Plugins #
###############

source $HOMEBREW_PREFIX/opt/zinit/zinit.zsh

zinit ice wait'0' lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait'0' lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit light zsh-users/zsh-syntax-highlighting

autoload -Uz compinit && compinit
zinit cdreplay -q

source <(fzf --zsh)

########################
# Aliases and Functions #
########################
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.zsh_functions ] && source ~/.zsh_functions

#################################
# Prompt and Shell Enhancements #
#################################
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
