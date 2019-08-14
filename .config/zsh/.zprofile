# Startx on login.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# Add Ruby to Path.
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
