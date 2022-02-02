# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch HIST_IGNORE_DUPS
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aldo/.zshrc'

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
# End of lines added by compinstall

# Prompt
PROMPT="%B%F{blue}[%n@%f%m %1~%F{blue}]%f$%b "

# Alias
alias ls='ls --group-directories-first --color=auto -h'
alias ip='ip --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias gcc='gcc -fdiagnostics-color=auto'

# Less colors
export LESS='-R --use-color -Dd+b$Du+w'
export MANPAGER="less -R --use-color -Dd+b -Du+w"
