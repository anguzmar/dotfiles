#
# ~/.bash_profile
#

# Execute "startx" on shell login.
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx -- -keeptty > ~/.xorg.log 2>&1
fi

# Add Ruby to Path.
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Silent startx.
#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null

# Source environment variables
if [ -f $HOME/.config/variables ]; then
    source $HOME/.config/variables
fi
