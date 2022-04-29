#!/bin/bash
yay -S alacritty bspwm sxhkd feh polybar xorg-xsetroot xorg-xbacklight light picom-jonaburg-git dunst rofi flameshot xfce4-power-manager ksuperkey gtop htop ncdu pamixer polkit-gnome i3lock-color fm6000 fortune-mod network-manager-applet neovim zsh zsh-autosuggestions zsh-syntax-highlighting oh-my-zsh-git catppuccin-gtk-theme papirus-icon-theme --needed --noconfirm
cp -R .config/* ~/.config/
chmod -R +x ~/.config/bspwm
chmod -R +x scripts
sudo cp -R scripts/* /usr/local/bin
