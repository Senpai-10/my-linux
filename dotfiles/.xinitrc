#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrandr --output HDMI-1 --primary
xrandr --output LVDS-1 --off

#compton --config ~/.config/compton/compton.conf &
picom --experimental-backends --backend glx &
deadd-notification-center &
xbindkeys &
nitrogen --restore &
imwheel -b 45

#exec openbox-session
#exec dwmblocks &
#exec dwm
