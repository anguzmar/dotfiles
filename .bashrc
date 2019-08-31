# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Enable forward-search (when using Ctrl-R) with Ctrl-S:
stty -ixon

# FZF completion and keybinds
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Load alises and functions. Also make sure the file exists
if [ -f $HOME/.config/aliases ]; then
    source $HOME/.config/aliases
fi

if [ -f $HOME/.config/custom_functions ]; then
    source $HOME/.config/custom_functions
fi

