if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /home/roni/soft/julia-1.6.2/bin /home/roni/soft/jdk-11.0.11+9/bin

# ENV vars
set EDITOR "nvim"
set TERM "kitty"
set -x MANPAGER "nvim -c 'set ft=man' -"

# Aliases
alias icat "kitty +kitten icat"
alias ls="exa -al --color=always --group-directories-first"
alias ls -la "exa -a --color=always --group-directories-first"

# Evals
eval (keychain --eval --agents ssh -Q --quiet $HOME/.ssh/github-arcovm)

starship init fish | source
