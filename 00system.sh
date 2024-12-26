#!/bin/sh

#Flatpak, makepkg és fastfetch
sudo sed -i 's/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto !autodeps)/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug !lto !autodeps)/' /etc/makepkg.conf
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo pacman -S zenity flatpak gnome-software fastfetch  --noconfirm

#AUR Helper
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd -
rm -rf yay-bin

#Flatseal flatpak appokhoz
yay -S flatseal --noconfirm
sudo cp -a overrides /home/$USER/.local/share/flatpak

#CachyOS kernel
curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh

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
  --title="Flatpak telepítve! Rendszer újraindul!" --width='400' \
  --text="Újrainditás" \
  --auto-close \
  --no-cancel
  sudo reboot;
  
fi

if [ $? = 1 ]; then

	exit 0;
fi
