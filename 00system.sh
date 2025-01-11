#!/bin/sh

#makepkg gyorsító script
sudo sed -i 's/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto !autodeps)/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug !lto !autodeps)/' /etc/makepkg.conf

#Programok
sudo pacman -S zenity flatpak gnome-software fastfetch ffmpeg hblock xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr unzip gnome-disk-utility wget zsh --noconfirm

#CPU's ucode (amd és intel)
  if [[ $CPU -gt 0 ]]; then
  sudo pacman -S amd-ucode --noconfirm
else
    sudo pacman -S intel-ucode --noconfirm
fi

#ucode boothoz hozzáadása
 if [[ $CPU -gt 0 ]]; then
	  echo "initrd   /amd-ucode.img" | sudo tee -a /boot/loader/entries/*.conf
  else
	  echo "initrd   /intel-ucode.img" | sudo tee -a /boot/loader/entries/*.conf
  fi


#Hblock
hblock

#AUR Helper
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd -
rm -rf yay-bin

#Flatseal for flatpak apps
yay -S flatseal --noconfirm
sudo cp -a overrides /home/$USER/.local/share/flatpak

#Nvidia kernel
sudo pacman -S linux-zen linux-zen-headers --noconfirm # Ellenőrzi, hogy rendesen telepítve vannak e kernel csomagjai
sleep 1
sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings egl-wayland lib32-nvidia-utils --noconfirm # Nvidia-DKMS és néhány Wayland csomagok
sleep 1
sudo sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf # Nvidia kernel korai betöltése
sleep 1
echo "options nvidia_drm modeset=1 fbdev=1" | sudo tee /etc/modprobe.d/nvidia.conf > /dev/null # Ellenőrzi, hogy bevan e töltve
sleep 1
sudo mkinitcpio -P

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
  --title="Csomagok telepítve! Rendszer hamarosan újraindul!" --width='400' \
  --text="Újrainditas" \
  --auto-close \
  --no-cancel
  sudo reboot;
  
fi

if [ $? = 1 ]; then

	exit 0;
fi
