if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

# ENV vars
set EDITOR "nvim"
set TERM "kitty"

# Aliases
alias icat "kitty +kitten icat"

starship init fish | source
