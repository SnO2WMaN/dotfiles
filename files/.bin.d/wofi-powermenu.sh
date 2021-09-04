#!/usr/bin/env bash

menu=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | wofi -i -b -p powermenu --dmenu --width 300 --lines=5 --conf=${HOME}/.config/wofi/powermenu.conf | awk '{print tolower($2)}' )

case $menu in
	poweroff)
		;&
    reboot)
    	;&
    suspend)
        systemctl suspend
        ;;
    lock)
		swaylock -f
		;;
    logout)
		swaymsg exit
        ;;
esac
