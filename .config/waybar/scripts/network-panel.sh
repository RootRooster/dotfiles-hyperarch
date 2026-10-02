#!/usr/bin/env bash
# Toggle nmrs (Cyber-themed via ~/.config/nmrs/style.css).
if pgrep -x nmrs >/dev/null; then pkill -x nmrs; else exec nmrs; fi
