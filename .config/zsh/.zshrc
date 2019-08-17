####################
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
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
fpath=("$ZDOTDIR/.zprompts" $fpath)

# Enable prompt theme system
autoload -Uz promptinit
promptinit

## SOURCE CONTROL RELATED STUFF ##
autoload -Uz vcs_info
setopt prompt_subst
setopt COMPLETE_ALIASES

# Select theme
prompt aphrodite
####################


# Extended globbing
setopt extended_glob

# Fish-like syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Find new executables in $PATH when using autocompletion
zstyle ':completion:*' rehash true

# Enable Ctrl+R history search (disabled at first because of vi keybinds)
bindkey "^R" history-incremental-search-backward

# Enable some useful commands in insert mode
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line

####### SYNTAX HIGHLIGHT COLORS #######
# Declare the variable (taken fron the documentation)
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[path]='fg=39'
ZSH_HIGHLIGHT_STYLES[alias]='fg=201,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=46,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=196'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=69,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=202,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=201'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=226,underline'
#####################

# Load alises and functions. Also make sure the file exists.
if [ -f $HOME/.config/aliases ]; then
    source $HOME/.config/aliases
fi

if [ -f $HOME/.config/custom_functions ]; then
    source $HOME/.config/custom_functions
fi
