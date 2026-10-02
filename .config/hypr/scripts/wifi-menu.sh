#!/usr/bin/env bash
# Rofi Wi-Fi menu (NetworkManager / nmcli). Uses the matugen-colored rofi theme.

rofi_cmd() {
  rofi -dmenu -i -config ~/.config/rofi/config-wifi.rasi "$@"
}

notify() {
  notify-send -a "Network" -i network-wireless-symbolic "$1" "$2"
}

wifi_state=$(nmcli -g WIFI radio)
current=$(nmcli -t -g ACTIVE,SSID dev wifi list --rescan no 2>/dev/null | sed -n 's/^yes://p' | head -n1)

labels=()
actions=()
add() { labels+=("$1"); actions+=("$2"); }

if [ "$wifi_state" = "enabled" ]; then
  add "󰖪  Turn Wi-Fi off" "off"
  add "󰑐  Rescan" "rescan"
  [ -n "$current" ] && add "󰖪  Disconnect from $current" "disconnect"

  declare -A seen
  # IN-USE:SIGNAL:SECURITY:SSID (SSID last, so colons inside it are safe)
  while IFS=: read -r inuse signal security ssid; do
    [ -z "$ssid" ] || [ -n "${seen[$ssid]}" ] && continue
    seen[$ssid]=1
    if   [ "$signal" -ge 75 ]; then icon="󰤨"
    elif [ "$signal" -ge 50 ]; then icon="󰤥"
    elif [ "$signal" -ge 25 ]; then icon="󰤢"
    else icon="󰤟"; fi
    lock=""; [ -n "$security" ] && [ "$security" != "--" ] && lock="  󰌾"
    mark=""; [ "$inuse" = "*" ] && mark="  (connected)"
    add "$icon  $ssid$lock$mark" "ssid:$security:$ssid"
  done < <(nmcli -t --escape no -f IN-USE,SIGNAL,SECURITY,SSID dev wifi list --rescan auto)
else
  add "󰖩  Turn Wi-Fi on" "on"
fi
add "󰒓  Advanced settings" "editor"

idx=$(printf '%s\n' "${labels[@]}" | rofi_cmd -p "Wi-Fi" -format i)
[ -z "$idx" ] && exit 0
action="${actions[$idx]}"

case "$action" in
  on)         nmcli radio wifi on && notify "Wi-Fi enabled" ;;
  off)        nmcli radio wifi off && notify "Wi-Fi disabled" ;;
  rescan)     nmcli dev wifi rescan 2>/dev/null; sleep 2; exec "$0" ;;
  disconnect) nmcli con down id "$current" >/dev/null && notify "Disconnected" "$current" ;;
  editor)     nm-connection-editor & ;;
  ssid:*)
    rest="${action#ssid:}"
    security="${rest%%:*}"
    ssid="${rest#*:}"
    [ "$ssid" = "$current" ] && exit 0

    # Known network: just bring the saved connection up
    known=0
    if nmcli -g NAME con show | grep -Fxq "$ssid"; then
      known=1
      if out=$(nmcli con up id "$ssid" 2>&1); then
        notify "Connected" "$ssid"
        exit 0
      fi
    fi

    if [ -n "$security" ] && [ "$security" != "--" ]; then
      pass=$(rofi_cmd -password -p "Password for $ssid" </dev/null)
      [ -z "$pass" ] && exit 0
      out=$(nmcli dev wifi connect "$ssid" password "$pass" 2>&1)
    else
      out=$(nmcli dev wifi connect "$ssid" 2>&1)
    fi
    if [ $? -eq 0 ]; then
      notify "Connected" "$ssid"
    else
      # Don't keep a newly created profile with a wrong password
      [ "$known" -eq 0 ] && nmcli con delete id "$ssid" >/dev/null 2>&1
      notify "Connection failed" "$out"
    fi
    ;;
esac
