#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto --hide __pycache__'
PS1='[\u@\h \W]\$ '

# Custom alias.
alias suspend='systemctl suspend'
alias cv='vim ~/Documents/cv/cv.tex'
alias Q30='bluetoothctl power on; bluetoothctl connect 11:1F:00:01:D0:C3'
alias disconnect-Q30='bluetoothctl disconnect 11:1F:00:01:D0:C3; bluetoothctl power off'
alias music-update-main='youtube-dl -o "~/Music/Main/%(title)s.%(ext)s" --download-archive ~/Music/Main/archive.txt https://www.youtube.com/playlist?list=PLDM507H18AIPZgxkmsaPBSiopZ_vntjhM'
alias weather='curl wttr.in/Granada'
alias vim='nvim'
alias ssh='TERM=xterm ssh'
alias enable-touchpad='xinput enable "SynPS/2 Synaptics TouchPad"'
alias disable-touchpad='xinput disable "SynPS/2 Synaptics TouchPad"'

# Functions.
xev-arch () {
	xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

packages () {
	pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
}

# TMUX stuff.
#[[ $- != *i* ]] && return # If not running interactively, do not do anything.
#[[ -z "$TMUX" ]] && exec tmux

#if which tmux >/dev/null 2>&1; then
    # If no session is started, start a new session.
#	test -z ${TMUX} && tmux

    # When quitting tmux, try to attach.
#	while test -z ${TMUX}; do
#		tmux attach || break
#	done
#fi
