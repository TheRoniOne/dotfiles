#!/bin/bash

mkdir -p ~/.config/pypoetry
rm -f $HOME/.config/pypoetry/config.toml && ln -sr ./pypoetry-config.toml $HOME/.config/pypoetry/config.toml

rm -f $HOME/.zshrc && ln -sr ./.zshrc $HOME/.zshrc

rm -f $HOME/.config/starship.toml && ln -sr ./starship.toml $HOME/.config/starship.toml

rm -f $HOME/.alacritty.toml && ln -sr ./alacritty.toml $HOME/.alacritty.toml

mkdir ~/.config/zellij
rm -f $HOME/.config/zellij/config.kdl && ln -sr ./zellij-config.kdl $HOME/.config/zellij/config.kdl
