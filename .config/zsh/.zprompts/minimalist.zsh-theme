#/usr/bin/env zsh
#
# Author: Angel Guzman
# ------------------------------------------------------------------------------

minimalist_get_prompt() {

	echo -n "%F{207}%2~%f " # Dir
	echo -n "${vcs_info_msg_0_}" # Git branch
	echo -n "%B%F{46}>%f%b%{$reset_color%} " # $ or #
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
export PROMPT=$'$(minimalist_get_prompt)'
