#!/usr/bin/env bash
# Copies the matugen-generated userChrome.css/userContent.css into every
# Firefox profile and enables userChrome support. Restart Firefox to apply.

src="$HOME/.cache/matugen/firefox"
ff="$HOME/.config/mozilla/firefox"
[ -f "$ff/profiles.ini" ] || exit 0

grep '^Path=' "$ff/profiles.ini" | cut -d= -f2- | while read -r path; do
  profile="$ff/$path"
  [ -d "$profile" ] || continue
  mkdir -p "$profile/chrome"
  cp "$src/userChrome.css" "$src/userContent.css" "$profile/chrome/"

  pref='user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);'
  grep -qF "$pref" "$profile/user.js" 2>/dev/null || echo "$pref" >>"$profile/user.js"
done
