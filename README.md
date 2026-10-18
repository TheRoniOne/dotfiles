# Home Manager

Standalone Nix Home Manager configuration for `Roni` on `x86_64-linux`, including
openSUSE. Nix manages the applications, shell plugins, and configuration files.
Dependencies are pinned in `flake.lock`.

## First switch

Install Nix with flakes enabled. The account and home directory are set in
`modules/home.nix`; change them there when using another account. If you already
use Home Manager, keep your existing `home.stateVersion`. For a new installation,
leave it at `26.05` when updating inputs.

If you previously used this repository with Stow, remove its links **before
updating the checkout to this layout**, using the old checkout:

```sh
stow --delete --verbose --target="$HOME" \
  cargo git helix herdr jj opencode starship wezterm xkb zed zsh
```

If you have already updated, unlink any old Stow symlinks pointing into this
repository before switching. Back up existing regular configuration files that
Home Manager reports as conflicts; Home Manager refuses to overwrite them.
The former `~/.wezterm.lua` must also be backed up or unlinked so WezTerm can read
the new `~/.config/wezterm/wezterm.lua`.

From this repository, add the new files to Git so Nix can see them, build a
generation, and then activate it:

```sh
git add -A
nix run .#home-manager -- build --flake .#Roni
nix run .#home-manager -- switch --flake .#Roni
```

After the first switch, the installed command can apply changes. Add new files
to Git before switching; modified tracked files are included automatically:

```sh
home-manager switch --flake .#Roni
```

Open a new terminal after switching. Home Manager manages the Zsh configuration;
changing the account's login shell is a separate system setting. WezTerm and
Herdr explicitly use the Nix-provided Zsh.

## Dendritic layout

This follows the [dendritic pattern](https://github.com/mightyiam/dendritic): every
Nix file under `modules/` is a flake-parts module implementing one feature.
`flake.nix` loads that tree with `import-tree`.

Feature files contribute to `flake.modules.homeManager.default`, which merges
their Home Manager settings. `modules/home.nix` uses that module to create
`homeConfigurations.Roni`. Add a feature by adding another Nix file under
`modules/` with the same shape; no import list needs updating:

```nix
{
  flake.modules.homeManager.default = { pkgs, ... }: {
    home.packages = [ pkgs.ripgrep ];
  };
}
```

| Module | Managed configuration |
| --- | --- |
| `cargo.nix` | Cargo, Rust tools, Clang, and the Wild linker |
| `git.nix` | Git identity, Mergiraf driver, and global attributes |
| `helix.nix` | Helix theme, cursors, and Rust Analyzer settings |
| `herdr.nix` | Herdr settings and terminal shell |
| `jj.nix` | Jujutsu identity and UI settings |
| `opencode.nix` | OpenCode and its existing MCP connections |
| `starship.nix` | Starship prompt and Zsh integration |
| `wezterm.nix` | WezTerm window size and Zsh command |
| `xkb/default.nix` | Graphite keyboard rules and symbols |
| `zed.nix` | Zed settings, Catppuccin extension, and JetBrains Mono |
| `zsh.nix` | Zsh, Oh My Zsh, plugins, Keychain, Fastfetch, pnpm, and Zoxide |

Herdr's binary is installed separately; this repository only provides its
configuration. Select the Graphite layout in your desktop or compositor after
activation; the XKB module installs the files without changing desktop settings.
Keychain continues to use your existing `~/.ssh/id_ed25519` key. The Git and
Jujutsu email addresses retain their original, different values.

## Updates and checks

```sh
nix flake update
nix flake check
home-manager switch --flake .#Roni
```

Review and commit `flake.lock` with dependency updates. `nix flake check` builds
the Home Manager activation package; it does not activate it. For evaluation
without building applications, use `nix flake check --no-build`.

To roll back an activated configuration, run `home-manager generations`, then
run the `activate` script in the desired generation's store path.
