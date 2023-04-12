#!/bin/bash

rm $HOME/.config/fish/config.fish & ln -sr ./fish/config.fish $HOME/.config/fish/config.fish
ln -sr ./starship.toml $HOME/.config/starship.toml
