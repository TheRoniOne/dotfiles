pacman -Syu
pacman -S nvim kitty fish starship
pacman -S lightdm lightdm-webkit2-greeter nitrogen

ln -s kitty.conf $HOME/.config/kitty.conf
ln -s config.fish $HOME/.config/fish/config.fish
ln -s leftwm_conf.toml $HOME/.config/leftwm/config.toml
ln -s lightdm.conf /etc/lightdm/lightdm.conf 
ln -s nitrogen.cfg $HOME/.config/nitrogen/nitrogen.cfg

systemctl enable lightdm
