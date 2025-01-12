#!/bin/sh

sudo pacman -S xfce4 xfce4-goodies lightdm lighdm-gtk-greeter gvfs pavucontrol xarchiver --noconfirm

sudo systemctl enable lightdm