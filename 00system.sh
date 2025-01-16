#!/usr/bin/env bash

# Removed because the script is fully tested!

# Editing pacman.conf

  sudo sed -i 's/#Color/Color/' /etc/pacman.conf
  sudo sed -i '38 i ILoveCandy' /etc/pacman.conf

# RaveOS Setup Script

# Text Colours
bold=$(tput bold)      # ${bold}
normal=$(tput sgr0)    # ${normal}
yellow=$(tput setaf 3) # ${yellow}

# Variables - Credit Lordify
CPU=$(lscpu | grep "AMD" -c)
nVidia=$(lspci -P | grep "NVIDIA" -c)
Locale=$(locale | grep "hu_HU" -c)

# Arch Linux linux-headers check and install script
# AlexC (c) 2025

# Get the current kernel version
kernel_version=$(uname -r)

# Check if kernel is hardened, lts, or zen and set the corresponding header package
if [[ "$kernel_version" == *"hardened"* ]]; then
    kernel_header_package="linux-hardened-headers"
    echo "Detected Hardened kernel."
elif [[ "$kernel_version" == *"lts"* ]]; then
    kernel_header_package="linux-lts-headers"
    echo "Detected LTS kernel."
elif [[ "$kernel_version" == *"zen"* ]]; then
    kernel_header_package="linux-zen-headers"
    echo "Detected Zen kernel."
else
    kernel_header_package="linux-headers"  # Default generic headers for Arch
    echo "Detected standard kernel."
fi

# Check the distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    distro=$ID
else
    echo "Cannot determine distribution."
    exit 1
fi

# Install the headers based on the detected kernel
if [[ "$distro" == "arch" ]]; then
    echo "Setting up headers for Arch Linux..."

    # Update the package database
    sudo pacman -Sy

    # Install the corresponding headers
    sudo pacman -S --noconfirm "$kernel_header_package"

    echo "Headers installed for kernel version $kernel_version."

else
    echo "Unsupported distribution: $distro"
    exit 1
fi

# Deleting password for the script to run uninterrapted

    echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/99-$USER
    echo "Defaults timestamp_timeout=-1" | sudo tee -a /etc/sudoers

# Making Makepkg a bit faster

    sudo sed -i 's/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto !autodeps)/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug !lto !autodeps)/' /etc/makepkg.conf

# Installing packages
    sudo pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter flatpak fuse2 networkmanager-qt hblock gnome-software gnome-disk-utility networkmanager base-devel bash-completion kcalc ffmpeg baobab git gparted xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-xlr ttf-ubuntu-font-family spectacle rebuild-detector gwenview qt5-wayland meson rsync zenity mesa-utils gvfs gvfs-mtp gvfs-smb android-tools wmctrl python-setuptools qt5-graphicaleffects qt5-quickcontrols2 ufw gufw unzip wget glib2 glib2-devel --noconfirm
    sudo systemctl enable NetworkManager.service
    sudo systemctl enable sddm.service
    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
    flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    hblock

# Downloading RavePkg
    mkdir cosmetics
    sudo chown -R $USER:$GROUP /home/$USER/cosmetics/
    cd cosmetics
    wget -O cosmetics.zip https://files.rp1.hu/api/public/dl/K7znaGkC/
    unzip cosmetics.zip
   
# AUR telepítés
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd -
    rm -rf yay-bin
    yay -S otf-san-francisco --noconfirm --sudoloop --save
    
# Flatseal - Flatpak app jogosultság beállító
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Flatseal${normal}

   yay -S flatseal --noconfirm
   sudo cp -a overrides /home/$USER/.local/share/flatpak

  echo ${bold}${yellow}Flatseal ${normal}installed.
  echo ---------------------------------------------
  echo

# UCode installer - Credit Lordify
  if [[ $CPU -gt 0 ]]; then
	  sudo pacman -S amd-ucode --noconfirm
  else
	  sudo pacman -S intel-ucode --noconfirm
  fi

# Adding ucode to boot entries - Credit Lordify
  if [[ $CPU -gt 0 ]]; then
	  echo "initrd   /amd-ucode.img" | sudo tee -a /boot/loader/entries/*.conf
  else
	  echo "initrd   /intel-ucode.img" | sudo tee -a /boot/loader/entries/*.conf
  fi

  # nVidia - Credit to Lordify
if [[ $nVidia -gt 0 ]]; then
	sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings egl-wayland lib32-nvidia-utils --noconfirm # nVidia-DKMS and some Wayland Packages
	sleep 1
	sudo sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf # Add early loading of nVidia kernel mode setting
	sleep 1
	echo "options nvidia_drm modeset=1 fbdev=1" | sudo tee /etc/modprobe.d/nvidia.conf > /dev/null # Make sure it is loaded...
	sleep 1
	sudo mkinitcpio -P
fi

# Local
    sudo sed -i 's/#en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen
    sudo sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
    sudo sed -i 's/#hu_HU.UTF-8 UTF-8/hu_HU.UTF-8 UTF-8/' /etc/locale.gen
    sudo locale-gen

        # Adding Custom rave command
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}rave command.${normal}
  echo
    sudo rsync -ap --info=progress2 /home/$USER/cosmetics/rave /usr/local/bin/
    sudo chmod +x /usr/local/bin/rave
    echo given privileges to run for rave
    sudo rsync -ap --info=progress2 /home/$USER/cosmetics/rave-comp.sh /etc/bash_completion.d/
    sudo chmod +x /etc/bash_completion.d/rave-comp.sh
    echo given privileges to run for rave-comp.sh
  echo
  echo ${bold}${yellow}Rave command with bash completion ${normal}installed.
  echo ---------------------------------------------

    # Autostarting ProgramScript after restart
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}ProgramScript Autostart${normal}
  echo
    mkdir -p /home/$USER/.config/autostart
    sudo chown -R $USER:$GROUP /home/$USER/.config/autostart
    echo Changed ownership to $USER /home/$USER/.config/autostart
    sudo rsync -ap --info=progress2 3progs.sh.desktop /home/$USER/.config/autostart
    echo Exec=/home/$USER/.progs/3progs.sh >> /home/$USER/.config/autostart/3progs.sh.desktop
    sudo mkdir -p /home/$USER/.progs
    echo Created .progs folder
    sudo chown -R $USER:$GROUP /home/$USER/.progs
    echo Changed ownership to $USER /home/$USER/.progs
    curl -Ls https://links.rp1.hu/3progs -o /home/$USER/.progs/3progs.sh
    sudo chmod +x /home/$USER/.progs/3progs.sh
    echo Changed ownership to $USER /home/$USER/.progs/3progs.sh
    sudo rsync -ap --info=progress2 content/. /home/$USER/.progs
  echo
  echo ${bold}${yellow}ProgramScript Autostart ${normal}installed.
  echo ---------------------------------------------

# Cleanup
    sudo rm /etc/sudoers.d/99-$USER
    sudo sed -i '140d' /etc/sudoers
    sudo rm -rf /home/$USER/cosmetics

# End of script
  echo Reboot in 3s...
  echo Reboot in 2s...
  echo Reboot in 1s...
  echo Reboot
  reboot