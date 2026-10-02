#!/usr/bin/env bash
# Toggle the Cyber-styled sound panel (pwvucontrol with its own GTK4 palette).
if pgrep -x pwvucontrol >/dev/null; then
  pkill -x pwvucontrol
else
  XDG_CONFIG_HOME="$HOME/.config/cyber-gtk" exec pwvucontrol
fi
