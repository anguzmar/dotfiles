# Startx on login.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# Add Ruby to Path.
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Export ENV variables.
export LC_TIME="en_GB.UTF-8"
export LC_PAPER="en_GB.UTF-8"
export LC_MEASUREMENT="en_GB.UTF-8"
export GPG_TTY=$(tty)
export PYTHONDONTWRITEBYTECODE=1
