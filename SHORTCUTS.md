# Shortcuts

Cheat sheet for this Hyprland (ML4W-based, Cyber-themed) setup.
`Super` = Windows key. Taken from the live key bindings on 2026-10-02.

Menus and panels close when you press their shortcut again.

Open it from anywhere: `shortcuts` · `less $SHORTCUTS` · `bat $SHORTCUTS`

**Where things live**

| What | Where |
|---|---|
| Core bindings (ML4W) | `~/.config/hypr/conf/keybindings/default.conf` |
| Your additions / overrides | `~/.config/hypr/conf/custom.conf` (loaded last, wins) |
| See all live bindings | `hyprctl binds` or `Super + Ctrl + K` |

---

## Apps & launchers

| Keys | Action |
|---|---|
| `Super + Space` | App launcher (rofi): APPS · AI · RUN · FILES · WINDOWS |
| `Super + T` | Terminal (kitty) |
| `Super + B` | Browser |
| `Super + E` | File manager |
| `Super + Shift + E` | yazi (terminal file manager), floating |
| `Super + V` | Clipboard history (see below) |
| `Super + Ctrl + E` | Emoji picker (rofimoji) |
| `Super + Ctrl + C` | Calculator (qalc: math, units, currency, hex/bin) |
| `Super + Ctrl + K` | Searchable list of all key bindings |

## Windows

| Keys | Action |
|---|---|
| `Super + Q` | Close window |
| `Super + Shift + Q` | Force-kill window (kills its process) |
| `Super + F` | Fullscreen (hides the bar) |
| `Super + Shift + F` | Toggle floating |
| `Super + M` | Maximize (keeps gaps and the bar) |
| `Super + G` | Toggle window group (tabs) |
| `Super + H / J / K / L` | Focus left / down / up / right |
| `Super + Shift + H / J / K / L` | Swap window left / down / up / right |
| `Super + Alt + H / J / K / L` | Resize (shrink width / grow height / shrink height / grow width) |
| `Super + Left-drag` | Move window |
| `Super + Right-drag` | Resize window |
| `Alt + Tab` | Cycle windows (hold to repeat) |
| `Ctrl + Tab` | Window switcher (search open windows by app / title) |
| `Super + Shift + T` | Make every window on the workspace float |

## Workspaces

| Keys | Action |
|---|---|
| `Super + 1 … 0` | Go to workspace 1 … 10 |
| `Super + Shift + 1 … 0` | Move window to workspace 1 … 10 |
| `Super + Ctrl + 1 … 0` | Move **all** windows to workspace 1 … 10 |
| `Super + Tab` / `Super + Shift + Tab` | Next / previous workspace |
| `Super + Ctrl + Down` | Next empty workspace |
| `Super + Scroll` | Previous / next workspace |
| `Super + S` | Show / hide the scratchpad |
| `Super + Shift + S` | Send window to the scratchpad |

## Monitors

| Keys | Action |
|---|---|
| `Super + ,` / `Super + .` | Focus previous / next monitor |
| `Super + Shift + ,` / `.` | Move window to previous / next monitor |
| `Super + Ctrl + ,` / `.` | Move the whole workspace to previous / next monitor |

## Screenshots

| Keys | Action |
|---|---|
| `Ctrl + Shift + 4` | Screenshot menu |
| `Super + Print` | Screenshot menu |
| `Super + Alt + F` | Instant full-screen screenshot (saved) |
| `Super + Alt + S` | Instant area screenshot (saved) |
| `Super + Alt + A` | Grab text: select an area, its text is copied (OCR) |

**Inside the screenshot menu** — lowercase = copy to clipboard, `Shift` = copy **and** save to `~/Pictures`

| Key | Copy | Copy + save |
|---|---|---|
| Area (screen freezes while you select) | `a` | `A` |
| Active window | `w` | `W` |
| Current monitor | `s` | `S` |
| All monitors | `f` | `F` |
| Delayed (then `3` / `5` / `0` = 3, 5, 10 s) | `d` | `D` |
| Area, then open in the editor (Pinta) | `e` | `E` |
| Selected row | `l` / `Enter` | `L` / `Shift + Enter` |
| Move | `j` / `k` | |
| Cancel | `q` / `h` / `Esc` | |

## Power & session

| Keys | Action |
|---|---|
| `Super + Ctrl + Q` | Power menu (press again to close) |
| `Super + Ctrl + L` | Lock screen |
| `Lock` key | Lock screen |
| `Super + Ctrl + R` / `Super + Shift + R` | Reload Hyprland config |

**Inside the power menu:** `L` lock · `E` log out · `U` suspend · `R` restart · `S` power off · arrows + `Enter` · `Esc` closes

## Desktop & appearance

| Keys | Action |
|---|---|
| `Super + Shift + W` | Random wallpaper |
| `Super + Ctrl + W` | Wallpaper picker |
| `Super + Alt + W` | Start the automatic wallpaper changer |
| `Super + Shift + B` | Reload Waybar |
| `Super + Ctrl + B` | Show / hide Waybar |
| `Super + Ctrl + T` | Waybar theme switcher (only Cyber is left) |
| `Super + Shift + A` | Toggle animations |
| `Super + Alt + G` | Game mode (turns off effects) |
| `Super + Shift + Scroll` | Zoom in / out |
| `Super + Shift + Z` | Reset zoom |

## Media & hardware keys

| Key | Action |
|---|---|
| Volume up / down / mute | Speaker volume (5% steps, hold to repeat) |
| Mic mute | Toggle microphone |
| Play / Pause / Next / Previous | Media control (playerctl) |
| Brightness up / down | Screen brightness (10% steps) |
| Keyboard backlight up / down | Keyboard backlight |
| Calculator key | Calculator |

---

## App launcher (`Super + Space`)

| Keys | Action |
|---|---|
| Type | Search |
| `Enter` | Launch / run |
| `Tab` / `Shift + Tab` | Next / previous tab (APPS → AI → RUN → FILES → WINDOWS) |
| `Ctrl + L` / `Ctrl + H` | Next / previous tab |
| `Ctrl + J` / `Ctrl + K` (or arrows) | Move down / up |
| `Esc` | Close |

### AI tab (personal agent)

`Super + Space` → `Tab` → type a question → `Enter`.
A chat window opens and the answer streams in live; it's also copied to the clipboard.

The agent lives in `~/.local/share/cyber-agent` (instructions `AGENT.md`, memory `memory/`,
saved scripts `scripts/`). It reads your dotfiles, runs commands and scripts without asking,
and takes a screenshot (without its own window) when a question is about what's on screen.
It remembers shortcuts and setup facts, not one-off how-tos. Say "remember …" / "forget …" to steer it.
Haiku answers quick questions; screen and multi-step tasks hand over to Sonnet (`↗` line).

| Keys (in the chat window) | Action |
|---|---|
| Type + `Enter` | Ask a follow-up (same conversation) |
| `Enter` on an empty line / `Ctrl + D` | Close |

## Waybar (mouse)

| Module | Left click | Right click | Other |
|---|---|---|---|
| Workspaces | Go to workspace | | Scroll: switch workspace |
| VPN IP (shows when tun/wg is up) | Copy the IP | | |
| Network | Network manager (nmrs) | Tray applet | Middle: quick Wi-Fi menu (rofi) |
| Volume | Sound panel | Mute | Scroll: volume |
| Bluetooth | Bluetooth (bluetui) | | |
| Hardware (CPU / MEM / DSK) | System monitor | | Hover to expand |
| Bell | Notification center | Do not disturb | |
| Power | Power menu | Lock screen | |
| Clock | Displays the time | — | — |

Clicking an open panel's icon again closes it (calendar, Bluetooth, sound, network).

## Panels

**Notification center** (bell) — Do-not-disturb switch, Wi-Fi / Bluetooth / mute / lock toggles, volume slider, notification list, Clear.


**Bluetooth (bluetui)** — `j` / `k` move · `Space` / `Enter` connect / disconnect · `s` scan on/off · `t` trust · `f` favourite · `u` unpair · `e` rename · `Tab` switch pane · `q` quit

**Sound (pwvucontrol) and network (nmrs)** — normal GTK keys: `Tab` / `Shift + Tab` move · arrows adjust sliders and lists · `Space` / `Enter` activate

**Clipboard history (`Super + V`)** — everything you copy is recorded (up to 750 entries; images get thumbnails).
Type to search · `Enter` copy · `Shift + Enter` copy and paste into the window you came from · `Ctrl + D` delete entry · `Ctrl + Shift + D` clear all (asks first) · `Ctrl + J / K` move · `Esc` close

**Screen shaders** (Waybar tools drawer → shader icon) — left click toggles the last shader on/off, right click picks one: Night light (warm, less blue light) · Vibrance · Off

**Calculator (qalc)** — type an expression, `Enter`. Examples: `2^16`, `0x41 to dec`, `255 to hex`, `5 GiB to MB`, `100 USD to EUR`. `Ctrl + D` or the shortcut again closes it.

**Lock screen** — type the password, `Enter`. The box turns magenta while checking, red if wrong, amber if Caps Lock is on.

---

## Terminal (zsh)

| Keys | Action |
|---|---|
| `Ctrl + R` | Fuzzy search command history (fzf) |
| `Ctrl + T` | Fuzzy pick a file, with preview (fzf) |
| `Alt + C` | Fuzzy `cd` into a directory (fzf) |
| `Esc` | Vi normal mode (zsh-vi-mode); `i` / `a` back to insert |
| `Ctrl + O` | Copy the current command line to the clipboard |
| `Alt + Left` / `Alt + Right` | Previous / next directory |
| `Alt + Up` | Go to the parent directory |

## tmux (default prefix: `Ctrl + b`)

| Keys | Action |
|---|---|
| `prefix c` | New window |
| `prefix n` / `prefix p` | Next / previous window |
| `prefix 0 … 9` | Go to window |
| `prefix ,` | Rename window |
| `prefix %` / `prefix "` | Split side by side / top and bottom |
| arrows after `prefix` | Move between panes |
| `prefix z` | Zoom pane |
| `prefix d` | Detach |
| `prefix [` | Copy mode (scroll / select) |

The session block on the left of the status bar turns magenta while the prefix is held.

