#!/usr/bin/env sh

# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. I keep those commands in ~/.xprofile because that
# file is run automatically if someone uses a display manager (login screen)
# and so they are needed there. To prevent doubling up commands, I source them
# here with the line below.

[ -f ~/.xprofile ] && . ~/.xprofile

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

sleep 2

if test -n "$WORK"; then
  xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output HDMI1 --mode 1920x1080 --pos 1366x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off
  CONFIGTOADDTOI3="$HOME/.config/i3/config.work"
elif test -n "$HOME_BIG_MONITOR"; then
  xrandr --output eDP1 --off --output HDMI1 --rate 75 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
  CONFIGTOADDTOI3="$HOME/.config/i3/config.home $HOME/.config/i3/config.home2"
elif test -n "$HOME_TWO_MONITOR"; then
  xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --rate 75 --mode 2560x1080 --pos 2560x0 --rotate normal --output VIRTUAL1 --off
  CONFIGTOADDTOI3="$HOME/.config/i3/config.home $HOME/.config/i3/config.home2"
else
  xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off
  CONFIGTOADDTOI3="$HOME/.config/i3/config.home2"
fi

setbg & # Set the background

rinit &

sleep 1

# Your default LARBS WM is determined in your `~/.profile` on login.  Here we
# run the proper command to run when the graphical environment starts.

## Dinamically build i3 config

cat ~/.config/i3/config.base $CONFIGTOADDTOI3 > ~/.config/i3/config

systemctl --user import-environment DISPLAY

case "$LARBSWM" in
  i3) exec i3 ;;
  *) echo "No valid LARBS window manager detected." ;;
esac
