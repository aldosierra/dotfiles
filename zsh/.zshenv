# ZSH Enviroment

# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# Clean Paths
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export LESSHISTFILE="-"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# Path
export PATH="$HOME/.local/bin:$HOME/.local/script:$PATH"

# Environment Variables
export PAGER=less
export EDITOR=nvim
# export VISUAL=emacs
export TERMINAL=st
[[ -n "$DISPLAY" ]] && export BROWSER=chromium || export BROWSER=lynx
