# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias diff='diff --color=auto'
PS1='[\u@\h \W]\$ '

# Enable forward-search (when using Ctrl-R) with Ctrl-S:
stty -ixon

# Custom alias.
alias suspend='systemctl suspend'
alias Q30='bluetoothctl power on; bluetoothctl connect 11:1F:00:01:D0:C3'
alias disconnect-Q30='bluetoothctl disconnect 11:1F:00:01:D0:C3; bluetoothctl power off'
alias music-update-main='youtube-dl -o "~/Media/Music/Main/%(title)s.%(ext)s" --download-archive ~/Media/Music/Main/archive.txt "https://www.youtube.com/playlist?list=PLDM507H18AIPZgxkmsaPBSiopZ_vntjhM"'
alias weather='curl -s wttr.in | head -n -1'
alias vim='nvim'
alias ssh='TERM=xterm ssh'
alias enable-touchpad='xinput enable "SynPS/2 Synaptics TouchPad" && xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1'
alias disable-touchpad='xinput disable "SynPS/2 Synaptics TouchPad"'
alias mininet='ssh -Y mininet@192.168.1.40'
alias update_lists_packages='pacman -Qqen > ~/.Packages_Installed.txt && pacman -Qqm > ~/.AUR_Packages_Installed.txt'
alias tfm='cd ~/Documents/School/TFM/'
alias xclipC='xclip -selection clipboard'
alias scan='nmap -sn 192.168.1.0/24'
alias size='du -sh .[!.]* * | sort -h'
alias ethernet='sudo systemctl start dhcpcd@eno1.service'
alias ethernet-dhcp='sudo systemctl start dhcpd4@eno1.service'
alias gpg-show='gpg --list-secret-keys --keyid-format LONG'
alias tree='tree -C'
alias mirrors_update='sudo /usr/bin/reflector --protocol https --latest 15 --sort rate --save /etc/pacman.d/mirrorlist'
alias cv-update='mv ~/Downloads/CV.pdf ~/Documents/CV/CV.pdf && zathura ~/Documents/CV/CV.pdf'

# Functions.
xev-arch () {
	xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

packages () {
	pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
}

stream_to_mpv () {
	youtube-dl --playlist-random --ignore-config -f bestaudio -q -o - "$1" | mpv -
}
