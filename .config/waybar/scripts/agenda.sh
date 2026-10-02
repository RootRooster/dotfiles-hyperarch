#!/usr/bin/env bash
# Calendar agenda from khal (synced from iCloud by vdirsyncer).
#
#   agenda.sh            Waybar JSON: calendar icon, agenda for the next 14 days on hover
#   agenda.sh --json     Plain JSON array of upcoming events (for scripts / code)
#   agenda.sh --sync     Sync with iCloud now, then refresh Waybar
#   agenda.sh --open     Toggle the interactive calendar (ikhal) in a floating kitty

RANGE="${AGENDA_RANGE:-14d}"
SEP=$'\x1f'

events() {
  khal list --day-format "" \
    --format "{start-date}${SEP}{start-time}${SEP}{end-time}${SEP}{title}${SEP}{calendar}${SEP}{location}" \
    now "$RANGE" 2>/dev/null
}

case "$1" in
  --json)
    events | jq -R -s --arg sep "$SEP" '
      split("\n") | map(select(length > 0) | split($sep)) |
      map({date: .[0], start: .[1], end: .[2], title: .[3], calendar: .[4], location: .[5],
           all_day: (.[1] == "")})'
    exit 0
    ;;
  --sync)
    notify-send -a "Calendar" "Syncing with iCloud…"
    if out=$(vdirsyncer sync 2>&1); then
      notify-send -a "Calendar" "Calendar synced"
    else
      notify-send -a "Calendar" -u critical "Sync failed" "$(tail -n 3 <<<"$out")"
    fi
    pkill -RTMIN+9 waybar
    exit 0
    ;;
  --open)
    exec ~/.config/waybar/scripts/cyber-term.sh cyber-calendar Calendar ikhal
    ;;
esac

esc() { sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g'; }

today=$(date +%d.%m.%Y)
tomorrow=$(date -d tomorrow +%d.%m.%Y)

has_today=0
tooltip=""
last_day=""
while IFS="$SEP" read -r day start end title cal loc; do
  [ -z "$day" ] && continue
  case "$day" in
    "$today") label="Today" ;;
    "$tomorrow") label="Tomorrow" ;;
    *) label=$(date -d "$(awk -F. '{print $3"-"$2"-"$1}' <<<"$day")" +"%a %d.%m.") ;;
  esac
  when="${start:-all day}"
  t=$(esc <<<"$title")

  [ "$label" = "Today" ] && has_today=1

  # Tooltip: grouped by day.
  if [ "$day" != "$last_day" ]; then
    [ -n "$tooltip" ] && tooltip+=$'\n'
    tooltip+="<b>$label</b>"$'\n'
    last_day="$day"
  fi
  span="${start:+$start–$end}"
  tooltip+="  ${span:-all day}  $t  <i>$cal</i>"$'\n'
done < <(events)

[ -z "$tooltip" ] && tooltip="No events in the next ${RANGE}"$'\n'
tooltip+=$'\n'"Left: open calendar · Right: sync now"
class="idle"; [ "$has_today" -eq 1 ] && class="today"
jq -cn --arg tooltip "${tooltip%$'\n'}" --arg class "$class" '{text: "󰃭", tooltip: $tooltip, class: $class}'
