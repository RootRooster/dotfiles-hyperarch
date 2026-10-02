#!/usr/bin/env bash
# Installs the matugen-generated Ghidra theme into every Ghidra settings dir
# and selects it. Ghidra reads the theme at startup, so restart it to apply.

src="$HOME/.cache/matugen/ghidra.theme"
[ -f "$src" ] || exit 0

if grep -q '^gtk-application-prefer-dark-theme=1' "$HOME/.config/gtk-3.0/settings.ini" 2>/dev/null; then
  laf="Flat Dark"; dark=true
else
  laf="Flat Light"; dark=false
fi

for dir in "$HOME"/.config/ghidra/ghidra_*/; do
  [ -d "$dir" ] || continue
  theme="${dir}themes/Matugen.theme"
  mkdir -p "${dir}themes"
  sed -e "s/@@LAF@@/$laf/" -e "s/@@DARK@@/$dark/" "$src" >"$theme"

  prefs="${dir}preferences"
  touch "$prefs"
  if grep -q '^Theme=' "$prefs"; then
    sed -i "s|^Theme=.*|Theme=File\\\\:$theme|" "$prefs"
  else
    echo "Theme=File\\:$theme" >>"$prefs"
  fi
done
