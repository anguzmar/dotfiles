#/usr/bin/env zsh
#
# Author: Angel Guzman
# ------------------------------------------------------------------------------

####### Detect VI mode #######
KEYTIMEOUT=1  # Remove delay when switching modes.
vim_ins_mode="%F{46}>%f"
vim_cmd_mode="%F{196}<%f"

function zle-line-init zle-keymap-select {
	vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
##############################


minimalist_get_prompt() {

	echo -n "%F{207}%2~%f " # Dir
	echo -n "${vcs_info_msg_0_}" # Git branch
	echo -n "%B${vim_mode}%b%{$reset_color%} "
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
