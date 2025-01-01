#!/bin/sh

#Magyarországi repo
sudo pacman -S reflector rsync --noconfirm
sudo reflector -c "Hungary" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

#Flatpak, makepkg (amitől gyorsabb lesz), neofetch, szoftver center
sudo sed -i 's/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto !autodeps)/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug !lto !autodeps)/' /etc/makepkg.conf
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo pacman -S zenity flatpak gnome-software neofetch ffmpeg hblock xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr unzip gnome-disk-utility wget zsh --noconfirm

#CPU-hoz kell (intel, amd)
sudo pacman -S amd-ucode intel-ucode --noconfirm
echo "initrd   /amd-ucode.img" | sudo tee -a /boot/loader/entries/*.conf

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

#Nvidia kernel
sudo pacman -S linux-zen-headers --noconfirm
sleep 1
sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings egl-wayland lib32-nvidia-utils --noconfirm
sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
sleep 1
echo "options nvidia_drm modeset=1 fbdev=1" | sudo tee /etc/modprobe.d/nvidia.conf > /dev/null
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
  --title="Flatpak telepitve! Rendszer újraindul!" --width='400' \
  --text="Újrainditas" \
  --auto-close \
  --no-cancel
  sudo reboot;
  
fi

if [ $? = 1 ]; then

	exit 0;
fi
