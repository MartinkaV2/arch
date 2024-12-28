#!/bin/sh

#Screenshot
sudo pacman -S gnome-screenshot --noconfirm

#Flatseal
flatpak install flathub com.github.tchx84.Flatseal-- noconfirm

#Mangohud & GOverlay
sudo pacman -S mangohud lib32-mangohud goverlay --noconfirm

#Vencord (Discord alternative with plugins)
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

#Gamemode & Gamescope
sudo pacman -S gamemode gamescope --noconfirm

#Papirus icon pack
sudo pacman -S papirus-icon-theme --noconfirm

#FreeTube
flatpak install flathub io.freetubeapp.FreeTube --noconfirm

#Lutris
sudo pacman -S lutris --noconfirm

#Steam Nvidia kártyákhoz
sudo pacman -S steam nvidia-utils lib32-nvidia-utils --noconfirm
sudo chmod +x update-proton-ge
./update-proton.sh

#OBS
flatpak install flathub com.obsproject.Studio

#Heroic
yay -S heroic-games-launcher-bin --noconfirm

#Brave
sudo pacman -S brave-bin --noconfirm

#P7Zip - tömörítő program
yay -S p7zip-full-bin --noconfirm

#Input-Remapper 2.0 - egér/bill. gomb konfiguráló, macro író program
yay -S input-remapper-bin --noconfirm

#QEMU - VM alkalmazás
sudo pacman -S qemu-full qemu-img libvirt virt-install virt-manager virt-viewer edk2-ovmf dnsmasq swtpm guestfs-tools libosinfo tuned dmidecode --noconfirm
sudo usermod -aG kvm $USER
sudo usermod -aG input $USER
sudo usermod -aG libvirt $USER
sudo sed -i '530d' /etc/libvirt/qemu.conf
sudo sed -i "530 i user = \"$USER"\" /etc/libvirt/qemu.conf
sudo sed -i 's/#group = "kvm"/group = "kvm"/' /etc/libvirt/qemu.conf

#Onlyoffice - (MS Office 365 alternative)
sudo pacman -S onlyoffice-bin --noconfirm

#Pavucontrol - Apponkénti hangerőszabályzás/konfigurálás

sudo pacman -S pavucontrol --noconfirm

#VLC - Videólejátszó
flatpak install org.videolan.VLC --user -y

#qBittorent - nyílt forráskódú torrent kliens
sudo pacman -S qbittorrent --noconfirm
cp -a qBittorrent /home/$USER/.config/

#Parabolic - Videóletöltö kliens
flatpak install flathub org.nickvision.tubeconverter --user -y

#Vibrant - szín beállitó kliens
flatpak install flathub io.github.libvibrant.vibrantLinux --user -y

#Double Commander - Total Commander alternative
sudo pacman -S doublecmd-gtk2 --noconfirm

#Monophony - hang kiszedő
yay -S monophony --noconfirm

