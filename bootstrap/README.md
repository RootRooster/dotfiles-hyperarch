# Bootstrap

Rebuilds this setup on a fresh Arch install.

```sh
git clone git@github.com:RootRooster/dotfiles-hyperarch.git ~/.mydotfiles/dotfiles.nixson
~/.mydotfiles/dotfiles.nixson/bootstrap/install.sh          # everything
~/.mydotfiles/dotfiles.nixson/bootstrap/install.sh system   # or one step
```

| Step | Does |
|---|---|
| `packages` | Adds the BlackArch repo (asks you to check strap.sh's SHA1), installs paru, then everything in `packages/` |
| `tools` | Pinned matugen 2.4.1 into `~/.local/bin` (templates are written for 2.x) |
| `dotfiles` | `stow` the repo into `~`; real files in the way go to `~/.dotfiles-backup/<date>/` |
| `system` | Copies `system/` to `/`, installs the SDDM theme, enables `services.txt`, sets zsh, docker group |

All steps are idempotent.

## Keeping it in sync

| When you… | Do |
|---|---|
| install/remove a package | `bootstrap/save-packages.sh`, commit |
| need something pacman doesn't track | add it to `packages/extra.txt` |
| change a file under `/etc` | copy it to `system/etc/...` |
| enable a system service | add it to `services.txt` |
