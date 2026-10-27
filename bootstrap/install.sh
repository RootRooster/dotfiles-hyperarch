#!/usr/bin/env bash
#    ____     __
#   / __/_ __/ /  ___ ____
#  / _// // / _ \/ -_) __/
#  \__/\_, /_.__/\__/_/
#     /___/  bootstrap
#
# Rebuild this setup on a fresh Arch install (user with sudo, network up):
#   git clone git@github.com:RootRooster/dotfiles-hyperarch.git ~/.mydotfiles/dotfiles.nixson
#   ~/.mydotfiles/dotfiles.nixson/bootstrap/install.sh
#
# Every step is idempotent, so it is also safe to re-run on a live system.
# Run a single step with: install.sh packages|tools|dotfiles|system
# -----------------------------------------------------
set -euo pipefail

BOOTSTRAP="$(cd "$(dirname "$0")" && pwd -P)"
REPO="$(dirname "$BOOTSTRAP")"

# Pinned: config templates are written for matugen 2.x (repos ship 4.x)
MATUGEN_VERSION="2.4.1"
MATUGEN_SHA256="dc62b3b752ba85b63cdec7d82521bcba1748b5a7f1a6f2643dd154eb5b77df14"

SDDM_THEME="/usr/share/sddm/themes/sddm-astronaut-theme"

step() { echo -e "\n\e[1;36m:: $*\e[0m"; }
list() { grep -vE '^\s*(#|$)' "$1"; }

# -----------------------------------------------------
# Repos + packages (pacman, BlackArch, AUR via paru)
# -----------------------------------------------------
packages() {
    step "Base tools"
    sudo pacman -Syu --needed --noconfirm base-devel git stow curl

    if ! grep -q '^\[blackarch\]' /etc/pacman.conf; then
        step "Adding the BlackArch repo"
        local tmp
        tmp="$(mktemp -d)"
        curl -fsSL -o "$tmp/strap.sh" https://blackarch.org/strap.sh
        echo "   Compare this with the SHA1 on https://blackarch.org/downloads.html:"
        sha1sum "$tmp/strap.sh"
        read -rp "   Run strap.sh? [y/N] " ok
        [[ $ok == [yY] ]] || { echo "   Aborted."; exit 1; }
        sudo bash "$tmp/strap.sh"
        rm -rf "$tmp"
    fi

    # paru is packaged in BlackArch, so no AUR bootstrap build is needed
    command -v paru >/dev/null || sudo pacman -S --needed --noconfirm paru

    step "Installing packages"
    sudo pacman -S --needed --noconfirm - < <(list "$BOOTSTRAP/packages/repo.txt")
    paru -S --needed --noconfirm - < <(list "$BOOTSTRAP/packages/aur.txt"; list "$BOOTSTRAP/packages/extra.txt")
}

# -----------------------------------------------------
# Tools that live in ~/.local/bin instead of a package
# -----------------------------------------------------
tools() {
    step "matugen $MATUGEN_VERSION -> ~/.local/bin"
    mkdir -p ~/.local/bin
    if [[ "$(~/.local/bin/matugen --version 2>/dev/null)" != "matugen $MATUGEN_VERSION" ]]; then
        local tmp
        tmp="$(mktemp -d)"
        curl -fsSL -o "$tmp/matugen.tgz" \
            "https://github.com/InioX/matugen/releases/download/v$MATUGEN_VERSION/matugen-$MATUGEN_VERSION-x86_64.tar.gz"
        echo "$MATUGEN_SHA256  $tmp/matugen.tgz" | sha256sum -c --quiet
        tar xzf "$tmp/matugen.tgz" -C "$tmp" matugen
        install -m755 "$tmp/matugen" ~/.local/bin/matugen
        rm -rf "$tmp"
    fi
}

# -----------------------------------------------------
# Symlink the repo into ~ with stow
# -----------------------------------------------------
dotfiles() {
    step "Linking dotfiles"
    # A fresh install ships its own ~/.bashrc etc. Move any real file that
    # would block a link into a backup folder instead of failing.
    local backup="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
    local f
    while IFS= read -r f; do
        if [[ -e "$HOME/$f" && ! -L "$HOME/$f" && "$(realpath "$HOME/$f")" != "$REPO/$f" ]]; then
            mkdir -p "$backup/$(dirname "$f")"
            mv "$HOME/$f" "$backup/$f"
            echo "   backed up ~/$f"
        fi
    done < <(git -C "$REPO" ls-files | grep -vE '^(bootstrap/|\.stow-local-ignore$)')

    # Real dirs, so stow links what's inside instead of folding all of ~/.config into the repo
    mkdir -p ~/.config ~/.local/bin
    stow -d "$(dirname "$REPO")" -t "$HOME" --restow "$(basename "$REPO")"
}

# -----------------------------------------------------
# /etc files, SDDM theme, services, user settings
# -----------------------------------------------------
system() {
    step "System config files"
    local f
    while IFS= read -r f; do
        sudo install -Dm644 "$BOOTSTRAP/system/$f" "/$f"
        echo "   /$f"
    done < <(cd "$BOOTSTRAP/system" && find . -type f -printf '%P\n')

    if [[ -d "$SDDM_THEME" ]]; then
        step "SDDM theme"
        sudo install -Dm644 "$REPO/.config/cyber-sddm/astronaut.conf.user" "$SDDM_THEME/Themes/astronaut.conf.user"
        sudo install -Dm644 "$REPO/.config/cyber-sddm/cyber.png" "$SDDM_THEME/Backgrounds/cyber.png"
    fi

    step "Services"
    sudo systemctl daemon-reload
    local unit
    while IFS= read -r unit; do
        sudo systemctl enable "$unit" 2>/dev/null && echo "   $unit" || echo "   $unit (not installed, skipped)"
    done < <(list "$BOOTSTRAP/services.txt")

    step "Cleaning the package cache"
    sudo systemctl start paccache.service

    step "User settings"
    [[ "$(getent passwd "$USER" | cut -d: -f7)" == /usr/bin/zsh ]] || chsh -s /usr/bin/zsh
    if getent group docker >/dev/null && ! id -nG | grep -qw docker; then
        sudo usermod -aG docker "$USER"
    fi
}

case "${1:-all}" in
    all) packages; tools; dotfiles; system ;;
    packages | tools | dotfiles | system) "$1" ;;
    *) echo "Usage: $0 [all|packages|tools|dotfiles|system]"; exit 1 ;;
esac

step "Done. Log out and back in (or reboot) to start Hyprland."
