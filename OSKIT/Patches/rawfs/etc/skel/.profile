# ~/.profile: Executed by Bourne-compatible login SHells.
#
# Path to personal scripts and executables (~/.local/bin).
[ -d "$HOME/.local/bin" ] || mkdir -p "$HOME/.local/bin"
export PATH=$HOME/.local/bin:$PATH

ONDEMAND=/etc/sysconfig/tcedir/ondemand
[ -d "$ONDEMAND" ] && export PATH=$PATH:"$ONDEMAND"

# Environment variables and prompt for Ash SHell
# or Bash. Default is a classic prompt.
#
PS1='\e[1;37m\u@\h\e[0m:\e[1;36m\w\e[0m\$ \e[?16;0;250c'
PS1='\e[1;36m[\u - \e[1;33m\w\e[1;36m] % \e[0m\e[?16;0;250c'
PAGER='less -EM'
MANPAGER='less -isR'

EDITOR=vi

export PS1 PAGER FILEMGR EDITOR MANPAGER

export BACKUP=1
[ "`id -un`" = "`cat /etc/sysconfig/tcuser`" ] && echo "$BACKUP" | sudo tee /etc/sysconfig/backup >/dev/null 2>&1
export FLWM_TITLEBAR_COLOR="58:7D:AA"

if [ -f "$HOME/.ashrc" ]; then
   export ENV="$HOME/.ashrc"
   . "$HOME/.ashrc"
fi

TERMTYPE=`/usr/bin/tty`

echo "    Welcome to OneCore Linux 2025 !"
echo
if [ -f "/usr/dt/bin/dtlogin" ]; then
	echo "******************************************************"
	echo "**"
	echo "**   1. RUN the Reference Desktop Environment"
	echo "**"
	echo "**   2. USE the terminal"
	echo "**"
	echo "******************************************************"
	echo
	while true; do
		read -p "[1/2]  % " choice
		case $choice in
			1)
				clear
				echo
				echo "        Launching the Reference Desktop Environment..."
				sudo mount devpts -t devpts /dev/pts -o remount,mode=666
				sudo /usr/dt/bin/dtlogin
				;;
			2)
				break
				;;
			*)
				echo
				;;
		esac
	done
fi

if [ -f "$(which startx)" ] && [ ! -f "/usr/dt/bin/dtlogin" ]; then
	echo
	echo "Xorg has been detected ! Type 'startx' to start the graphical interface."
	echo
fi
