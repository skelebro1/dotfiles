#!/bin/bash

#Install yay AUR helper
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay
makepkg -si
cd ..
rm -rf yay

#Install packages using yay
yay -S --noconfirm polybar firefox picom-git thunar hack rofi zsh oh-my-zsh-git pfetch-git kitty catppuccin-cursors-mocha catppuccin-gtk-theme-mocha feh bspwm sxhkd

#Copy contents to /home/$USER/.config/bspwm
cp -r ./* /home/$USER/.config/bspwm

cp -r /usr/share/oh-my-zsh/templates/zshrc.zsh-template /home/$USER/.zshrc

echo "Installation done!"

