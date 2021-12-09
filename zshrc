# Histfile
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
# General opts
setopt autocd extendedglob nomatch notify
unsetopt beep
# Completion
zstyle :compinstall filename '$HOME/.zshrc'
autoload -U colors && colors
autoload edit-command-line; zle -N edit-command-line
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
# Cursor shape
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
# Ranger 
run_ranger () {
    echo
    ranger --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N run_ranger
# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Prompt
eval "$(starship init zsh)"
# Keybinds
bindkey -v
bindkey '^r' run_ranger
bindkey '^e' edit-command-line
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Alias
alias ls='ls --color=auto --group-directories-first -h'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias tree='tree --dirsfirst -C'
alias ka='killall -9'
alias zrc='nvim ~/.zshrc'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias dot='cd $DOTFILES'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
# Env
export DOTFILES=/home/aldo/Projects/dotfiles
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export CODEEDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export COLORTERM="truecolor"
export PAGER="less"
export WM="awesome"
export KEYTIMEOUT=1
# Path
export PATH=$HOME/.local/bin:$HOME/.local/share/nvim/lsp_servers/lua-language-server/bin/Linux:$PATH
