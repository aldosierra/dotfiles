# Histfile
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
# General opts
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# Completion
zstyle :compinstall filename '/home/aldo/.zshrc'
autoload -U colors && colors
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Starship prompt
eval "$(starship init zsh)"
# Alias
alias ls='ls --color=auto --group-directories-first -h'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
alias tree='tree --dirsfirst -C'
alias ka='killall -9'
alias zrc='nvim ~/.zshrc'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
# Env
export DOTFILES=/home/aldo/Projects/dotfiles
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export CODEEDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export PAGER="less"
export WM="awesome"
# Path
export PATH=$HOME/.local/share/nvim/lsp_servers/lua-language-server/bin/Linux:$PATH
