####################
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt appendhistory autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/angel/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
####################

####### THEME RELATED STUFF #######
# Add custom theme's directory
fpath+=$HOME/.config/zsh/.zfunc
fpath+=$ZDOTDIR/.zprompts

# Enable prompt theme system
autoload -Uz promptinit
promptinit

## SOURCE CONTROL RELATED STUFF ##
autoload -Uz vcs_info
setopt prompt_subst
setopt COMPLETE_ALIASES

# Select theme
prompt minimalist
####################

# Remove duplicates from historu
setopt hist_ignore_all_dups

# Fix history issues between panes when using tmux
setopt inc_append_history
setopt share_history

# Fish-like syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Extended globbing
setopt extended_glob

# FZF keybinds and autocompletion
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
zstyle ':completion:*' menu select=2  # Only start the menu if there are 2 ambiguous possibilities
zmodload zsh/complist

# Navigate select menu
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# Find new executables in $PATH when using autocompletion
zstyle ':completion:*' rehash true

# Enable some useful commands in insert mode
bindkey "^e" end-of-line
bindkey "^a" beginning-of-line

# Keybinds for the lazy
bindkey -s '^o' 'dot status^M'
bindkey -s '^y' 'source $(fd -t f -p activate$ */bin)^M'


####### SYNTAX HIGHLIGHT COLORS #######
# Declare the variable (taken fron the documentation)
typeset -A ZSH_HIGHLIGHT_STYLES

# Activate highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Common command line stuff
ZSH_HIGHLIGHT_STYLES[path]='fg=39'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=39'
ZSH_HIGHLIGHT_STYLES[alias]='fg=219'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=46'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=196'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=69'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=15'
ZSH_HIGHLIGHT_STYLES[function]='fg=202'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=201'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=226,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=76'

# Bracket pairing
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=46,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=202,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=226,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=129,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=196,bold'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=14,bold,standout'
#####################


# Load alises and functions. Also make sure the file exists.
if [ -f $HOME/.config/aliases ]; then
    source $HOME/.config/aliases
fi

if [ -f $HOME/.config/custom_functions ]; then
    source $HOME/.config/custom_functions
fi

# Load the environment variables
if [ -f $HOME/.config/variables ]; then
    source $HOME/.config/variables
fi
