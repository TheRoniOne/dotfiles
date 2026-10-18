# Dotfiles

Each top-level directory is a GNU Stow package. Files inside a package mirror
their destination under your home directory. For example,
`helix/.config/helix/config.toml` becomes `~/.config/helix/config.toml`.

Install GNU Stow using your system package manager (`sudo zypper install stow`
on openSUSE), then run these commands from this repository.

Preview the packages you want:

```sh
stow --simulate --verbose --no-folding --target="$HOME" git helix jj starship
```

Create the links by running the same command without `--simulate`:

```sh
stow --verbose --no-folding --target="$HOME" git helix jj starship
```

Always specify `--target="$HOME"`: this repository can live anywhere, including
`~/Downloads/dotfiles`. `--no-folding` creates individual file links so apps can
create other files in their configuration directories without adding them here.

Available packages:

| Package | Destination |
| --- | --- |
| `cargo` | `~/.cargo/config.toml` |
| `git` | `~/.config/git/` |
| `helix` | `~/.config/helix/` |
| `jj` | `~/.config/jj/` |
| `opencode` | `~/.config/opencode/` |
| `starship` | `~/.config/starship.toml` |
| `wezterm` | `~/.wezterm.lua` |
| `xkb` | `~/.config/xkb/` |
| `zed` | `~/.config/zed/settings.json` |
| `zsh` | `~/.zshrc` |

To enable everything, preview first, then remove `--simulate`:

```sh
stow --simulate --verbose --no-folding --target="$HOME" \
  cargo git helix jj opencode starship wezterm xkb zed zsh
```

If Stow reports a conflict, move the existing file to a backup outside the
destination path and run the preview again. Stow will refuse to replace existing
files. Avoid `--adopt` unless you intend to replace the repository's versions
with your local files.

Remove a package's links (keeping the repository files):

```sh
stow --delete --verbose --target="$HOME" helix
```

After adding or moving files within a package, refresh its links:

```sh
stow --restow --verbose --no-folding --target="$HOME" helix
```

Keep this repository at the same location after linking; moving it breaks the
relative symlinks. If you need to move it, unstow first, move it, then stow again.

Stow only manages links; it does not install apps, themes, plugins, or fonts.
The Zsh config expects Oh My Zsh, its autosuggestions and syntax-highlighting
plugins, and several command-line tools. Home directory paths use `$HOME`.
Cargo selects Clang and the Wild
linker. The XKB package provides layout files but does not select the keyboard
layout for your desktop.
