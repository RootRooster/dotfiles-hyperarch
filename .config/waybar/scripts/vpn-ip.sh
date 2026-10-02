#!/usr/bin/env bash
# Shows the IPv4 of the first active VPN interface (tun*/wg*/tap*) for Waybar.
# Prints nothing when no VPN is up, so the module hides itself.
# --copy: copy that IP to the clipboard.

read -r iface ip < <(ip -o -4 addr show 2>/dev/null |
  awk '$2 ~ /^(tun|wg|tap)/ {split($4, a, "/"); print $2, a[1]; exit}')

if [ "$1" = "--copy" ]; then
  [ -n "$ip" ] && printf '%s' "$ip" | wl-copy && notify-send -a "VPN" "Copied $ip" "$iface"
  exit 0
fi

[ -z "$ip" ] && exit 0
printf '{"text":"󰖂 %s","tooltip":"%s · click to copy","class":"up"}\n' "$ip" "$iface"
