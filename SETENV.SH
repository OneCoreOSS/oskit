#!/bin/sh
##############################
# OSKit 1.0
#  $ source SETENV.SH
##############################

# OSKit Vars
OSK_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
OSK_DATA="$OSK_ROOT/OSKIT"
OSK_ADDONS="$OSK_DATA/Addons"
OSK_HELP="$OSK_DATA/UserHelp"
OSK_OSINFO="$OSK_DATA/OSInfo"
OSK_OSPATCHES="$OSK_DATA/Patches"

clear
echo "********************************************************************************"
echo "** Welcome to OSKit ! You have successfully started a dev environment. "
echo "**  To learn the basics on how to build an OS using OSKit type 'ohelp'"
echo "**"
cat "$OSK_HELP/Welcome.txt"
echo "********************************************************************************"
echo

OSK_QUIT="true"
OSK_RESTOREPS1="PS1=\"$PS1\""

for Addon in $OSK_ADDONS/*.kit; do
	SELF_ADDON=$(echo $(basename $Addon) | sed 's/\.kit//g')
	alias $SELF_ADDON="OSK_OPS1=\"$PS1\" OSK_ROOT=$OSK_ROOT OSK_DATA=$OSK_DATA sh $Addon"
	OSK_QUIT="$OSK_QUIT && unalias $SELF_ADDON"
done

alias quit="$OSK_QUIT && $OSK_RESTOREPS1"

PS1="(OSKIT) [\w]  % "
