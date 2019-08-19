# Startx on login.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx -- -keeptty > ~/.xorg.log 2>&1
fi

# Add Ruby to Path.
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
