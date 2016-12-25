#!/bin/sh

setxkbmap -option compose:ralt
/usr/bin/xscreensaver -no-splash &
xbindkeys &
exec xmonad
