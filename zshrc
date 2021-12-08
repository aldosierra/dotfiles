# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aldo/.zshrc'
autoload -U colors && colors
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugins
# ZSH Autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# ZSH Syntax Highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Starship prompt
eval "$(starship init zsh)"
# Alias
# ls
alias ls='ls --color=auto --group-directories-first -h'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
# diff
alias diff='diff --color=auto'
# grep
alias grep='grep --color=auto'
# ip
alias ip='ip --color=auto'
# less
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
# tree
alias tree='tree --dirsfirst -C'
# killall
alias ka='killall -9'
# ZSH Config
alias zrc='nvim ~/.zshrc'
# Git
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'
# Ranger
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#Env
export DOTFILES=/home/aldo/Projects/dotfiles
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export CODEEDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export PAGER="less"
export WM="awesome"
# Lua language server 
export PATH=$HOME/.local/share/nvim/lsp_servers/lua-language-server/bin/Linux:$PATH
