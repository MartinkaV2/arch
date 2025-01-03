#!/bin/bash

# Text modifiers
bold=$(tput bold)      # ${bold}
normal=$(tput sgr0)    # ${normal}
yellow=$(tput setaf 3) # ${yellow}

# APT/Flatpak APP TELEPITO SCRIPT

# Entering work folder
cd /home/$USER/.progs
sudo chown -R $USER:$GROUP /home/$USER/
cp -a rp-programscript.desktop /home/$USER/.local/share/applications/
echo "Exec=/home/$USER/.progs/3progs.sh" >> /home/$USER/.local/share/applications/rp-programscript.desktop

# Steam GPU Grep from Lordify
    nVidia=$(lspci -P | grep "NVIDIA" -c)


# Zenity ablak megjelenítése
user_choice=$(zenity --list --checklist --width='1000' --height='1000' \
  --title="APP Telepítő Script base by Airman & RAVE (Magyarosította balage79)" \
  --text="Válassz az alábbi programok közül:" \
  --column="Válassz" --column="Programnév / Leírás" \
  FALSE "Brave - webböngésző" \
  FALSE "CoreCTRL - AMD GPU beállító alkalmazás" \
  FALSE "Csak a FO Monitoron jelenjen meg a Login Screen - Tobb monitoros setupoknal" \
  FALSE "Docker - Ha tudod mi ez akkor KELL Neked" \
  FALSE "Darktable - Adobe Lightroom Linuxos megfelelője" \
  FALSE "Discord - VoIP-, és csevegőalkalmazás" \
  FALSE "DosBox - Régi, DOS-os játék emulátor" \
  FALSE "Double Commander - Total Commander Linuxos megfelelője" \
  FALSE "Easy Effects - Hangkártyát vezérlő program (Hangeffektek)" \
  FALSE "Firejail - Bongeszo Zart Kontener" \
  FALSE "FreeTube - Adatlopás-mentes YouTube-kliens" \
  FALSE "GameMode" \
  FALSE "GNOME Clocks - ébresztő, világóra, stopper, időzítő" \
  FALSE "GNOME Screenshot - gyorsbillentyűs képernyőkép létrehozás" \
  FALSE "GTKStressTesting - CPU Monitorozas es Stress Test Program" \
  FALSE "Heroic Launcher - Epic Games Launcher Linux verziója" \
  FALSE "Input-Remapper 2.0 - egér/bill. gomb konfiguráló, macro író progi" \
  FALSE "Kdenlive - Linuxos videószerkesztő program" \
  FALSE "KeepassXC - Jelszókezelő, az adatbázist titkosítva tárolja a PC-n" \
  FALSE "KVM QEMU - virtualizáció, virtuális gépek futtatása" \
  FALSE "Legutobbi Baloldali Menupont Torlese a File Kezelobol (Nautilus)" \
  FALSE "Librewolf - Firefox ESR alapú webböngésző" \
  FALSE "Lutris - Game launchereket, és egyéb appokat futtató környezet" \
  FALSE "MangoHud/Goverlay - MSI Afterburner Linuxos megfelelője, FPS kijelzés, stb." \
  FALSE "Midnight Commander - 2 ablakos file kezelő" \
  FALSE "Monophony - Youtube videokbol kiszedi a hangot. Jo cucc podcastokhoz" \
  FALSE "Mumble - hang alapú csevegőalkalmazás" \
  FALSE "Fastfetch - terminálos rendszerinfó megjelenítő" \
  FALSE "OnlyOffice - Legujabb MS Office Linuxos megfeleloje - LIBREOFFICE-t TOROLNI FOGJA!" \
  FALSE "OBS - Nyílt forrású felvételkészítő és streamelő program" \
  FALSE "Parabolic - Videóletöltő, működik minden platformon" \
  FALSE "P7Zip - tömörítő program" \
  FALSE "Pavucontrol - Apponkénti hangerőszabályzás/konfigurálás" \
  FALSE "PhotoGIMP - Adobe Photoshop-szerű képszerkesztő Linuxra" \
  FALSE "QBittorrent - torrent kliens" \
  FALSE "Signal - Titkosított üzenetküldő" \
  FALSE "Spotify - Zenelejátszó Linuxra" \
  FALSE "Spotube - Ingyenes Premium Spotify Zenelejátszó Linuxra" \
  FALSE "Steam Launcher" \
  FALSE "Telegram - Titkosított üzenetküldő" \
  FALSE "Vibrant - Szín szaturáció beállító program" \
  FALSE "Vivaldi - webböngésző" \
  FALSE "VLC - médialejátszó" \
  FALSE "Windows 11 Telepítő - Csak Profiknak!" \
  FALSE "Zenpower3 - AMD CPU Feszultseg, Aramerosseg es Fogyasztas Monitorozas" )
if [[ $? -eq 1 ]]; then
   echo ${bold}${yellow}Cancelled by User. Exiting!${normal}
   exit 1
fi

if [[ $user_choice = *"GNOME Screenshot - gyorsbillentyűs képernyőkép létrehozás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GNOME Screenshot${normal}

    sudo pacman -S gnome-screenshot --noconfirm

  echo ${bold}${yellow}GNOME Screenshot ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GNOME Clocks - ébresztő, világóra, stopper, időzítő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GNOME Clocks${normal}

    sudo pacman -S gst-plugins-base gst-plugins-good gnome-clocks --noconfirm
    sudo cp -a gnome-clocks/data/sounds/alarm-clock-elapsed.oga /usr/share/sounds/freedesktop/stereo
    sudo cp -a gnome-clocks/data/sounds/complete.oga /usr/share/sounds/freedesktop/stereo
    echo "[[ -f ~/.profile ]] && . ~/.profile" >> /home/$USER/.bash_profile
    echo "export G_RESOURCE_OVERLAYS=/org/gnome/clocks/sounds=/usr/share/sounds/freedesktop/stereo" >> /home/$USER/.profile
    echo "Reboot is needed!"

  echo ${bold}${yellow}GNOME Clocks with sound changes ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Steam Launcher"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Steam Launcher${normal}

  if [[ $nVidia -gt 0 ]]; then
    sudo pacman -S steam nvidia-utils lib32-nvidia-utils --noconfirm
  else
    sudo pacman -S steam vulkan-radeon lib32-vulkan-radeon --noconfirm
  fi
  sudo chmod +x update-proton-ge
  ./update-proton-ge

  echo ${bold}${yellow}Steam + Latest ProtonGE ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Heroic Launcher - Epic Games Launcher Linux verziója"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Heroic Launcher with MangoHud${normal}

  yay -S heroic-games-launcher-bin --noconfirm

  echo ${bold}${yellow}Heroic Launcher with MangoHud ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GameMode"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GameMode${normal}

  sudo pacman -S gamemode lib32-gamemode gamescope --noconfirm

  echo ${bold}${yellow}GameMode ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"P7Zip - tömörítő program"* ]]; then
  echo
  echo Installing ${bold}${yellow}P7Zip${normal}

  yay -S p7zip-full-bin --noconfirm

  echo ${bold}${yellow}P7Zip ${normal}installed.
  echo
fi

if [[ $user_choice = *"Fastfetch - terminálos rendszerinfó megjelenítő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Fastfetch${normal}

  sudo pacman -S fastfetch --noconfirm
  echo "fastfetch" >> .bashrc && source .bashrc

  echo ${bold}${yellow}Fastfetch ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Input-Remapper 2.0 - egér/bill. gomb konfiguráló, macro író progi"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Input-Remapper 2.0${normal}

  yay -S input-remapper-bin --noconfirm

  echo ${bold}${yellow}Input-Remapper 2.0 ${normal}installed.
  echo ---------------------------------------------
  echo
fi


if [[ $user_choice = *"Mumble - hang alapú csevegőalkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Mumble${normal}

  sudo pacman -S mumble --noconfirm

  echo ${bold}${yellow}Mumble ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Lutris - Game launchereket, és egyéb appokat futtató környezet"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Lutris with MangoHud${normal}

  sudo pacman -S lutris --noconfirm

  echo ${bold}${yellow}Lutris with MangoHud compatibility ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"KVM QEMU - virtualizáció, virtuális gépek futtatása"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}KVM QEMU${normal}

  sudo pacman -S qemu-full qemu-img libvirt virt-install virt-manager virt-viewer edk2-ovmf dnsmasq swtpm guestfs-tools libosinfo tuned dmidecode --noconfirm
  sudo usermod -aG kvm $USER
  sudo usermod -aG input $USER
  sudo usermod -aG libvirt $USER
  sudo sed -i '530d' /etc/libvirt/qemu.conf
  sudo sed -i "530 i user = \"$USER"\" /etc/libvirt/qemu.conf
  sudo sed -i 's/#group = "kvm"/group = "kvm"/' /etc/libvirt/qemu.conf
  
  echo ${bold}${yellow}KVM QEMU ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"CoreCTRL - AMD GPU beállító alkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}CoreCTRL and User Settings${normal}

  sudo pacman -S corectrl --noconfirm
  #systemd missing
  cp /usr/share/applications/org.corectrl.CoreCtrl.desktop ~/.config/autostart/
  echo "polkit.addRule(function(action, subject) {
    if ((action.id == \"org.corectrl.helper.init\" ||
         action.id == \"org.corectrl.helperkiller.init\") &&
        subject.local == true &&
        subject.active == true &&
        subject.isInGroup(\"$USER\")) {
            return polkit.Result.YES;
    }
});" | sudo tee /etc/polkit-1/rules.d/90-corectrl.rules > /dev/null
  sudo cp -a corectrl.ini /home/$USER/.config/
  sudo sed -i '/options/s/$/ amdgpu.ignore_min_pcap=1 amdgpu.ppfeaturemask=0xffffffff /' /boot/loader/entries/*.conf
  echo ${bold}${yellow}CoreCTRL and User settings ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Docker - Ha tudod mi ez akkor KELL Neked"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Docker${normal}

  sudo pacman -S docker --noconfirm

  echo ${bold}${yellow}Docker ${normal}installed.
  echo ---------------------------------------------
  echo
fi


if [[ $user_choice = *"OBS - Nyílt forrású felvételkészítő és streamelő program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}OBS Studio${normal}

  flatpak install com.obsproject.Studio/x86_64/stable --user -y

  echo ${bold}${yellow}OBS Studio ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Firejail - Bongeszo Zart Kontener"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}FireJail${normal}

  sudo pacman -S firejail --noconfirm

  echo ${bold}${yellow}FireJail ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Vivaldi - webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Vivaldi${normal}

  sudo pacman -S vivaldi vivaldi-ffmpeg-codecs --noconfirm
  cp -a vivaldi /home/$USER/.config/

  echo ${bold}${yellow}Vivaldi ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Brave - webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Brave${normal}

  sudo pacman -S brave-bin --noconfirm
  sudo cp -a /home/$USER/.progs/BraveSoftware /home/$USER/.config/

  echo ${bold}${yellow}Brave ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Librewolf - Firefox ESR alapú webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Librewolf${normal}

  yay -S librewolf-bin --noconfirm
  cp -a /home/$USER/.progs/.librewolf/. /home/$USER/
  
  echo ${bold}${yellow}LibreWolf ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"FreeTube - Adatlopás-mentes YouTube-kliens"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}FreeTube${normal}

  yay -S freetube-bin --noconfirm
  sudo cp -a FreeTube /home/$USER/.config/

  echo ${bold}${yellow}FreeTube ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"OnlyOffice - Legujabb MS Office Linuxos megfeleloje - LIBREOFFICE-t TOROLNI FOGJA!"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}OnlyOffice${normal}

  sudo pacman -S onlyoffice-bin --noconfirm

  echo ${bold}${yellow}OnlyOffice ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"DosBox - Régi, DOS-os játék emulátor"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}DosBox Staging${normal}

  yay -S dosbox-x --noconfirm

  echo ${bold}${yellow}DosBox - Staging ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Pavucontrol - Apponkénti hangerőszabályzás/konfigurálás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Pavucontrol${normal}

  sudo pacman -S pavucontrol --noconfirm

  echo ${bold}${yellow}Pavucontrol ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"KeepassXC - Jelszókezelő, az adatbázist titkosítva tárolja a PC-n"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}KeepassXC${normal}

  sudo pacman -S keepassxc --noconfirm

  echo ${bold}${yellow}KeePassXC ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Spotify - Zenelejátszó Linuxra"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Spotify${normal}

  yay -S spotify --noconfirm

  echo ${bold}${yellow}Spotify ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Spotube - Ingyenes Premium Spotify Zenelejátszó Linuxra"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Spotube${normal}

  yay -S spotube-bin --noconfirm

  echo ${bold}${yellow}Spotube ${normal}installed.
  echo ---------------------------------------------
  echo
fi


if [[ $user_choice = *"Darktable - Adobe Lightroom Linuxos megfelelője"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Darktable${normal}

  flatpak install flathub org.darktable.Darktable --user -y

  echo ${bold}${yellow}Darktable ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"VLC - médialejátszó"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}VLC Media Player${normal}

  flatpak install org.videolan.VLC --user -y

  echo ${bold}${yellow}VLC Media Player ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"QBittorrent - torrent kliens"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}QBittorrent${normal}

  sudo pacman -S qbittorrent --noconfirm
  cp -a qBittorrent /home/$USER/.config/

  echo ${bold}${yellow}QBittorrent ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Telegram - Titkosított üzenetküldő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Telegram${normal}

  sudo pacman -S telegram-desktop --noconfirm

  echo ${bold}${yellow}Telegram ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Signal - Titkosított üzenetküldő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Signal${normal}

  sudo pacman -S signal-desktop --noconfirm

  echo ${bold}${yellow}Signal ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Kdenlive - Linuxos videószerkesztő program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Kdenlive${normal}

  sudo pacman -S kdenlive --noconfirm

  echo ${bold}${yellow}Kdenlive ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"PhotoGIMP - Adobe Photoshop-szerű képszerkesztő Linuxra"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}PhotoGIMP- flatpak${normal}

  flatpak install flathub org.gimp.GIMP --user -y
  sudo rsync -ap --info=progress2 PhotoGIMP/. ~/

  echo ${bold}${yellow}GIMP with PhotoGIMP Addon ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Discord - VoIP-, és csevegőalkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Discord${normal}
  
  flatpak install flathub com.discordapp.Discord --user  -y

  # Vencord script credit to Lordify

  # Add USER repo to flathub, because Linux Mint doesn't have it
  #flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  # Download the latest release of Vencord Installer from Github
  wget https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli-linux
  sleep 1
  # Grant execution permission to vencord installer
  sudo chmod +x VencordInstallerCli-linux
  sleep 1
  # Create Symlink of /home/$USER directory in /usr/share/Vencord, because the Kurva Vencord script doesn't handle variables like $USER
  sudo ln -s ~/ /usr/share/Vencord
  sleep 1
  # Install vencord with openasar
  ./VencordInstallerCli-linux -install -location /usr/share/Vencord/.local/share/flatpak/app/com.discordapp.Discord
  sleep 1
  ./VencordInstallerCli-linux -install-openasar -location /usr/share/Vencord/.local/share/flatpak/app/com.discordapp.Discord/
  sleep 1
  # Remove symlink from /usr/share/Vencord
  sudo unlink /usr/share/Vencord
  sleep 1
  sudo mkdir -p /home/$USER/.var/app/com.discordapp.Discord/config/Vencord
  sudo chown -R $USER:$GROUP /home/$USER/.var/app/com.discordapp.Discord/config/Vencord/
  cp -a /home/$USER/.progs/themes/ /home/$USER/.var/app/com.discordapp.Discord/config/Vencord/themes

  echo ${bold}${yellow}Discord / Vencord ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Easy Effects - Hangkártyát vezérlő program (Hangeffektek)"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Easy Effects${normal}

  sudo pacman -S easyeffects --noconfirm

  echo ${bold}${yellow}Easy Effects ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Parabolic - Videóletöltő, működik minden platformon"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Parabolic${normal}

  flatpak install flathub org.nickvision.tubeconverter --user -y

  echo ${bold}${yellow}Parabolic ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Vibrant - Szín szaturáció beállító program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Vibrant${normal}

  flatpak install flathub io.github.libvibrant.vibrantLinux --user -y

  echo ${bold}${yellow}Vibrant ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Legutobbi Baloldali Menupont Torlese a File Kezelobol (Nautilus)"* ]]; then
  echo
  echo ---------------------------------------------
  echo Removing ${bold}${yellow}Nautilus Recent Menu ${normal}

  gsettings set org.gnome.desktop.privacy remember-recent-files false

  echo ${bold}${yellow}Nautilus Recent Menu ${normal}removed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Csak a FO Monitoron jelenjen meg a Login Screen - Tobb monitoros setupoknal"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Only main monitor on login${normal}

  zenity --warning --text='!!  SWITCH TO PRIMARY MONITOR ONLY  !!' --width='300' --height='100'
  sudo cp ~/.config/monitors.xml /var/lib/gdm3/.config/monitors.xml
  sudo chown gdm:gdm /var/lib/gdm3/.config/monitors.xml

  echo ${bold}${yellow}Only main monitor on login ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"MangoHud/Goverlay - MSI Afterburner Linuxos megfelelője, FPS kijelzés, stb."* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}MangoHud/Goverlay - built from source${normal}
  
  sudo pacman -S mangohud lib32-mangohud goverlay --noconfirm

  echo ${bold}${yellow}MangoHud/Goverlay - built from source ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Zenpower3 - AMD CPU Feszultseg, Aramerosseg es Fogyasztas Monitorozas"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Zenpower3 - built from source${normal}
  
  yay -S zenpower3-dkms --noconfirm
  sudo modprobe zenpower
  
  echo ${bold}${yellow}Zenpower3 ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GTKStressTesting - CPU Monitorozas es Stress Test Program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GTKStressTesting${normal}

  flatpak install flathub com.leinardi.gst --user -y

  echo ${bold}${yellow}GTKStressTesting ${normal}installed.
  echo ---------------------------------------------
  echo
fi


if [[ $user_choice = *"Double Commander - Total Commander Linuxos megfelelője"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Double Commander${normal}

  sudo pacman -S doublecmd-gtk2 --noconfirm

  echo ${bold}${yellow}Double Commander ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Midnight Commander - 2 ablakos file kezelő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Midnight Commander${normal}

  sudo pacman -S mc --noconfirm

  echo ${bold}${yellow}Midnight Commander ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Monophony - Youtube videokbol kiszedi a hangot. Jo cucc podcastokhoz"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Monophony${normal}

  yay -S monophony --noconfirm

  echo ${bold}${yellow}Monophony ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Windows 11 Telepítő - Csak Profiknak"* ]]; then
  zenity --warning --text='!! MAJOM VAGY !!' --width='300' --height='100'
fi

# Cleanup

  sudo rm /home/$USER/.config/autostart/3progs.sh.desktop
  sudo chown -R $USER:$GROUP /home/$USER/


zenity --question --title='Restart required!' --text='Restart in 5 seconds?' --width='300' --height='100'
if [ $? = 0 ]; then
  
(
echo "0" ; 
echo "# Restart in 5s" ; sleep 1
echo "20" ; 
echo "# Restart in 4s" ; sleep 1
echo "40" ; 
echo "# Restart in 3s" ; sleep 1
echo "60" ; 
echo "# Restart in 2s" ; sleep 1
echo "80" ; 
echo "# Restart in 1s" ; sleep 1 

) |
zenity --progress \
 --title="All updates are Installed!" --width='300' \
 --text="Restart" \
 --auto-close \
 --no-cancel
 sudo rm -rf /usr/share/raveprogs
 sudo rm /home/$USER/.config/autostart/raveprogs.desktop
 sudo reboot;
 else
 echo ${bold}${yellow}User exited the script. Ending!${normal}
 exit 0;  
fi