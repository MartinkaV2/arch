#!/bin/sh

#Flatpak, makepkg (amitől gyorsabb lesz), neofetch, szoftver center
sudo sed -i 's/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto !autodeps)/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug !lto !autodeps)/' /etc/makepkg.conf
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo pacman -S zenity flatpak gnome-software neofetch ffmpeg hblock xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr unzip gnome-disk-utility wget --noconfirm

#AMD CPU-hoz kell
sudo pacman -S amd-ucode --noconfirm
echo "initrd   /amd-ucode.img" | sudo tee -a /boot/loader/entries/*.conf

#Magyarországi repo
sudo pacman -S reflector rsync --noconfirm
sudo reflector -c "Hungary" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

#Hblock
hblock

#AUR Helper
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd -
rm -rf yay-bin

#Flatseal flatpak appokhoz
yay -S flatseal --noconfirm
sudo cp -a overrides /home/$USER/.local/share/flatpak



(
echo "0" ; 
echo "# Ujrainditas: 10" ; sleep 1
echo "10" ; 
echo "# Ujrainditas: 9" ; sleep 1
echo "20" ; 
echo "# Ujrainditas: 8" ; sleep 1
echo "30" ; 
echo "# Ujrainditas: 7" ; sleep 1
echo "40" ; 
echo "# Ujrainditas: 6" ; sleep 1
echo "50" ; 
echo "# Ujrainditas: 5" ; sleep 1
echo "60" ; 
echo "# Ujrainditas: 4" ; sleep 1
echo "70" ; 
echo "# Ujrainditas: 3" ; sleep 1
echo "80" ; 
echo "# Ujrainditas: 2" ; sleep 1
echo "90" ; 
echo "# Ujrainditas: 1" ; sleep 1
) |
zenity --progress \
  --title="Flatpak telepitve! Rendszer újraindul!" --width='400' \
  --text="Újrainditas" \
  --auto-close \
  --no-cancel
  sudo reboot;
  
fi

if [ $? = 1 ]; then

	exit 0;
fi
