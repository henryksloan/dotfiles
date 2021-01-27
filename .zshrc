ZSH_THEME="agnoster"

export DEFAULT_USER=$(id -un)

source ~/.profile

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

plugins=(git common-aliases)

export KEYTIMEOUT=1

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export EDITOR='vim'

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig

# Set keybinds
bindkey -e
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^K' kill-line
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

alias xrdb='xrdb ~/.Xresources'
alias mb='ls -l --block-size=M'
alias vim='nvim'

source ~/.bin/name.sh && name
