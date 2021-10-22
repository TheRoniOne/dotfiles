if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

fish_add_path /home/roni/soft/julia-1.6.2/bin /home/roni/soft/jdk-11.0.11+9/bin

# ENV vars
set EDITOR "nvim"
set TERM "kitty"

# Aliases
alias icat "kitty +kitten icat"

starship init fish | source
