#!/usr/bin/env bash
# Shared toggle for rofi-based menus: pressing a menu's shortcut again closes it.
#
#   source ~/.config/hypr/scripts/menu-toggle.sh
#   menu_toggle clipboard || exit 0
#
# - same menu already open      → close it, return 1 (caller exits)
# - a different menu is open    → close that one, return 0 (caller opens its own)
# - nothing open                → return 0
# The marker stores "<name> <pid of the script that opened it>", so a stale marker
# from a menu that already closed is never mistaken for an open one.

menu_toggle() {
  local name="$1" marker="${XDG_RUNTIME_DIR:-/tmp}/rofi-menu" open_name open_pid same=0 i

  if pgrep -x rofi >/dev/null; then
    read -r open_name open_pid < "$marker" 2>/dev/null
    # Decide before closing: once rofi is killed, the script that opened it exits too
    if [ "$open_name" = "$name" ] && [ -n "$open_pid" ] && kill -0 "$open_pid" 2>/dev/null; then
      same=1
    fi
    pkill -x rofi
    for i in {1..20}; do pgrep -x rofi >/dev/null || break; sleep 0.05; done
    [ "$same" -eq 1 ] && return 1
  fi

  printf '%s %s\n' "$name" "$$" > "$marker"
  return 0
}
