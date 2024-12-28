#!/bin/sh

#Flatseal
flatpak install flathub com.github.tchx84.Flatseal-- noconfirm

#Mangohud
mkdir mangohud
cd mangohud/
git clone https://aur.archlinux.org/mangohud-git.git
cd mangohud-git/
makepkg -si --noconfirm
cd ..
rm -rf mangohud-git

#lib32-mangohud
cd mangohud/
git clone https://aur.archlinux.org/lib32-mangohud-git.git
cd lib32-mangohud-git
makepkg -si --noconfirm
cd ..
rm -rf lib32-mangohud-git
cd ..
rm -rf mangohud

#Vencord (Discord alternative with plugins)
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

#GOverlay
git clone https://aur.archlinux.org/goverlay-git.git
cd goverlay-git/
makepkg -si
cd ..
rm -rf goverlay-git

#Gamemode & Gamescope
sudo pacman -Sy gamemode gamescope --noconfirm

#Papirus icon pack
sudo pacman -S papirus-icon-theme --noconfirm

#FreeTube
flatpak install flathub io.freetubeapp.FreeTube --noconfirm

#Lutris
sudo pacman -Sy lutris --noconfirm

#Steam
sudo pacman -Sy steam --noconfirm

#OBS
flatpak install flathub com.obsproject.Studio

#Heroic
git clone https://aur.archlinux.org/heroic-games-launcher-bin.git
cd heroic-ganes-launcher-bin/
makepkg -si --noconfirm
cd ..
rm -rf heroic-games-launcher

#Brave
git clone https://aur.archlinux.org/brave-bin.git
cd brave-bin/
makepkg -si --noconfirm
cd ..
rm -rf brave-bin
