if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ENV vars
set EDITOR "helix"
# set TERM "alacritty"
set -x MANPAGER "nvim -c 'set ft=man' -"

# Aliases

# Evals
keychain --eval --quiet $HOME/.ssh/id_ed25519 | source
starship init fish | source
pyenv init - | source

# pnpm
set -gx PNPM_HOME "/home/roni/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
