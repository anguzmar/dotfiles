#/usr/bin/env zsh
#
# Author: Sergei Kolesnikov
# https://github.com/win0err/aphrodite-terminal-theme
#
# Modified by Angel Guzman
# ------------------------------------------------------------------------------

####### Detect VI mode #######
KEYTIMEOUT=1  # Remove delay when switching modes.
vim_ins_mode="%F{46}[I]%f"
vim_cmd_mode="%F{196}[N]%f"

function zle-line-init zle-keymap-select {
	vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
##############################


aphrodite_get_welcome_symbol() {

	local welcome_symbol='$'
	[ $EUID -ne 0 ] || welcome_symbol='#'

	echo -n $welcome_symbol
}

aphrodite_get_prompt() {

	echo -n "%B${vim_mode}%b " # Vim mode
	echo -n "%B%F{51}%n%f" # User
	echo -n "%F{8}@%f" # at
	echo -n "%F{226}%m%f%b" # Host
	echo -n "%F{8}:%f " # in
	echo -n "%{$reset_color%}%2~ " # Dir
	echo -n "${vcs_info_msg_0_}" # Git branch
	echo -n "%{$reset_color%}$(aphrodite_get_welcome_symbol)%{$reset_color%} " # $ or #
}


zstyle ':vcs_info:*' actionformats '%B%F{196}|%f%%b \uf126 %B%F{57}%u%b%c%f%%b '
zstyle ':vcs_info:*' formats '%B%F{196}|%f%%b \uf126 %B%F{46}%u%b%c%f%%b '

# Check for staged and unstaged files (slows down the prompt rendering a tiny bit)
#zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "*"
zstyle ':vcs_info:*' unstagedstr "%F{202}"

# Only enable git, no need to check for other vcs
zstyle ':vcs_info:*' enable git

# Apparently pretty important
precmd () { vcs_info }

# MEGA IMPORTANT: RERUNS FUNCTIONS EVERY TIME THE PROMPT IS RENDERED
export PROMPT=$'$(aphrodite_get_prompt)'
