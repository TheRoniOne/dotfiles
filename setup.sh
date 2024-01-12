#!/bin/bash

rm -f $HOME/.config/fish/config.fish && ln -sr ./fish/config.fish $HOME/.config/fish/config.fish

rm -f $HOME/.zshrc && ln -sr ./.zshrc $HOME/.zshrc

rm -f $HOME/.config/starship.toml && ln -sr ./starship.toml $HOME/.config/starship.toml
