#!/bin/bash

$ Update and installs
echo updating and installing required packages
pacman -Syu
pacman -S nvim kitty fish starship
pacman -S leftwm feh polybar picom rofi
pacman -S lightdm lightdm-webkit2-greeter nitrogen

# fish as default shell
echo changing default shell to fish
chsh -s 'which fish'

# Create symbolic links to dotfiles
echo creating sym link for kitty.conf
ln -s kitty.conf $HOME/.config/kitty/kitty.conf
echo creating sym link for config.fish
ln -s config.fish $HOME/.config/fish/config.fish
echo creating sym link for starship.toml
ln -s starship.toml $HOME/.config/starship.toml
echo creating sym link for config.rasi
ln -s config.rasi $HOME/.config/rofi/config.rasi
echo creating sym link for leftwm_conf.toml
ln -s leftwm_conf.toml $HOME/.config/leftwm/config.toml
echo creating sym link for lightdm.conf
ln -s lightdm.conf /etc/lightdm/lightdm.conf
echo creating sym link for nitrogen.cfg
ln -s nitrogen.cfg $HOME/.config/nitrogen/nitrogen.cfg
echo creating sym link for .profile
ln -s .profile $HOME/.profile
echo creating sym link for init.lua
ln -s init.lua $HOME/.config/nvim/init.lua

# Enable services
echo enabling lightdm at startup
systemctl enable lightdm

# Install extras
paru -S exa bat ripgrep fd procs