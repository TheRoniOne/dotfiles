if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ENV vars
set EDITOR "nvim"
set TERM "kitty"
set -x MANPAGER "nvim -c 'set ft=man' -"

# Aliases

# Evals
keychain --eval $HOME/.ssh/id_ed25519 | source
starship init fish | source
