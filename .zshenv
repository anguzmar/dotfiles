ZDOTDIR=$HOME/.config/zsh

# Some basic quality of life
export EDITOR=nvim
export TERM=termite

# How the song is displayed in polybar
export MPC_FORMAT="%position% %file%"

# Local stuff
export LC_TIME="en_GB.UTF-8"
export LC_PAPER="en_GB.UTF-8"
export LC_MEASUREMENT="en_GB.UTF-8"

# I forgot why I needed this
export GPG_TTY=$(tty)

# I do not like __pycache__
export PYTHONDONTWRITEBYTECODE=1

# FZF settings
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git'"
export FZF_DEFAULT_OPTS="--border --no-mouse --height 50% --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -50'"
