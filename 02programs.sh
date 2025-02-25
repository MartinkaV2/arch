#!/bin/bash

# Text modifiers
bold=$(tput bold)      # ${bold}
normal=$(tput sgr0)    # ${normal}
yellow=$(tput setaf 3) # ${yellow}

# APT/Flatpak APP TELEPITO SCRIPT

# Entering work folder
cd /home/$USER/.progs
mkdir -p /home/$USER/.local/share/applications/
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
  FALSE "Audacious - Music Player" \
  FALSE "Bitwarden - Jelszókezelő kliens" \
  FALSE "Bluetooth - Ha hasznalsz BT-t tedd fel" \
  FALSE "Bottles - Wine prefix kezelő" \
  FALSE "Brave - webböngésző" \
  FALSE "Cider - Apple Music Player Linuxra" \
  FALSE "CoreCTRL - AMD GPU beállító alkalmazás" \
  FALSE "Csak a FO Monitoron jelenjen meg a Login Screen - Tobb monitoros setupoknal" \
  FALSE "Darktable - Adobe Lightroom Linuxos megfelelője" \
  FALSE "Discord - VoIP-, és csevegőalkalmazás" \
  FALSE "Docker - Ha tudod mi ez akkor KELL Neked" \
  FALSE "DosBox - Régi, DOS-os játék emulátor" \
  FALSE "Double Commander - Total Commander Linuxos megfelelője" \
  FALSE "Easy Effects - Hangkártyát vezérlő program (Hangeffektek)" \
  FALSE "Fastfetch - terminálos rendszerinfó megjelenítő" \
  FALSE "Firejail - Bongeszo Zart Kontener" \
  FALSE "FreeTube - Adatlopás-mentes YouTube-kliens" \
  FALSE "GameMode" \
  FALSE "GNOME Clocks - ébresztő, világóra, stopper, időzítő" \
  FALSE "GNOME Screenshot - gyorsbillentyűs képernyőkép létrehozás" \
  FALSE "GTKStressTesting - CPU Monitorozas es Stress Test Program" \
  FALSE "Heroic Launcher - Epic Games Launcher Linux verziója" \
  FALSE "Input-Remapper 2.0 - egér/bill. gomb konfiguráló, macro író progi" \
  FALSE "Jellyfin - Jellyfin Media Player" \
  FALSE "KDEConnect - Gep es telefon link" \
  FALSE "Kdenlive - Linuxos videószerkesztő program" \
  FALSE "KeepassXC - Jelszókezelő, az adatbázist titkosítva tárolja a PC-n" \
  FALSE "KVM QEMU - virtualizáció, virtuális gépek futtatása" \
  FALSE "Krusader - Total Commander like 2 paneles filekezelő" \
  FALSE "Legutobbi Baloldali Menupont Torlese a File Kezelobol (Nautilus)" \
  FALSE "LibreOffice - Office Suite" \
  FALSE "Librewolf - Firefox ESR alapú webböngésző" \
  FALSE "Lutris - Game launchereket, és egyéb appokat futtató környezet" \
  FALSE "MangoHud/Goverlay - MSI Afterburner Linuxos megfelelője, FPS kijelzés, stb." \
  FALSE "Midnight Commander - 2 ablakos filekezelő" \
  FALSE "Mumble - hang alapú csevegőalkalmazás" \
  FALSE "Nyomtato - Ha hasznalsz nyomtatot, tedd fel" \
  FALSE "OnlyOffice - Legujabb MS Office Linuxos megfeleloje - LIBREOFFICE-t TOROLNI FOGJA!" \
  FALSE "OBS - Nyílt forrású felvételkészítő és streamelő program" \
  FALSE "Parabolic - Videóletöltő, működik minden platformon" \
  FALSE "P7Zip - tömörítő program" \
  FALSE "Pamac - Grafikus csomagkezelő" \
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
  FALSE "XPadNeo - XBox Controller Support" \
  FALSE "Zenpower3 - AMD CPU Feszultseg, Aramerosseg es Fogyasztas Monitorozas" )
if [[ $? -eq 1 ]]; then
   echo ${bold}${yellow}Cancelled by User. Exiting!${normal}
   exit 1
fi
if [[ $user_choice = *"Audacious - Music Player"* ]]; then
  echo
  echo ---------------------------------------------  
  echo Installing ${bold}${yellow}Audacious${normal}

    sudo pacman -S audacious --noconfirm

  echo ${bold}${yellow}Audacious ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Bluetooth - Ha hasznalsz BT-t tedd fel"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Bluetooth${normal}

    sudo pacman -S bluez bluez-qt bluez-qt5 bluez-libs bluez-tools --noconfirm
    sudo systemctl enable bluetooth

  echo ${bold}${yellow}Bluetooth ${normal}installed.
  echo ---------------------------------------------
  echo
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

    sudo pacman -S itstool vala meson gst-plugins-base gst-plugins-good --noconfirm
    cd gnome-clocks
    meson setup ravedir
    cd ravedir
    sudo meson install
    cd /home/$USER/.progs

  echo ${bold}${yellow}GNOME Clocks with sound changes ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Steam Launcher"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Steam Launcher${normal}

    sudo pacman -S steam-native-runtime --noconfirm
    sudo chmod +x update-proton-ge
    ./update-proton-ge
    echo "GSK_RENDERER=gl" | sudo tee -a /etc/environment

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
  echo "fastfetch" >> /home/$USER/.bashrc

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

if [[ $user_choice = *"Nyomtato - Ha hasznalsz nyomtatot, tedd fel"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Printers${normal}

  sudo pacman -S cups hplip cnifilter2 --noconfirm
  sudo systemctl enable cups --now

  echo ${bold}${yellow}Printers ${normal}installed.
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
  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service
  sudo virsh net-autostart default
  
  
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
});" | sudo tee /etc/polkit-1/rules.d/90-corectrl.rules
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

  yay -S brave-bin --noconfirm
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

  yay -S onlyoffice-bin --noconfirm

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
  sudo pacman -S noto-fonts-emoji --noconfirm

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

  sudo pacman -S easyeffects lsp-plugins-lv2 lsp-plugins-standalone --noconfirm

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

  yay -S vibrantlinux --noconfirm

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
  echo Setting ${bold}${yellow}Only main monitor on login${normal}

  zenity --warning --text='!!  SWITCH TO PRIMARY MONITOR ONLY  !!' --width='300' --height='100'
  sudo mkdir -p /var/lib/gdm/.config/
  sudo cp ~/.config/monitors.xml /var/lib/gdm/.config/monitors.xml
  sudo chown gdm:gdm /var/lib/gdm/.config/monitors.xml

  echo ${bold}${yellow}Only main monitor on login ${normal}set.
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

if [[ $user_choice = *"Midnight Commander - 2 ablakos filekezelő"* ]]; then
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

if [[ $user_choice = *"Jellyfin - Jellyfin Media Player"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Jellyfin${normal}

  yay -S jellyfin-media-player --noconfirm

  echo ${bold}${yellow}Jellyfin Media Player ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"XpadNeo - XBox Controller Support"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Jellyfin${normal}

  yay -S xpadneo-dkms --noconfirm

  echo ${bold}${yellow}XPadNeo ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Krusader - Total Commander like 2 paneles filekezelő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Krusader${normal}

  sudo pacman -S krusader --noconfirm

  echo ${bold}${yellow}Krusader ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Bitwarden - Jelszókezelő kliens"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Bitwarden${normal}

  sudo pacman -S bitwarden --noconfirm

  echo ${bold}${yellow}Bitwarden ${normal}installed.
  echo ---------------------------------------------
  echo 
fi

if [[ $user_choice = *"LibreOffice - Office Suite"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}LibreOffice${normal}

  sudo pacman -S libreoffice-fresh libreoffice-fresh-hu --noconfirm

  echo ${bold}${yellow}LibreOffice ${normal}installed.
  echo ---------------------------------------------
  echo 
fi

if [[ $user_choice = *"Bottles - Wine prefix kezelő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Bottles${normal}

  flatpak install com.usebottles.bottles --user -y

  echo ${bold}${yellow}Bottles ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Pamac - Grafikus csomagkezelő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Pamac${normal}  

  yay -S pamac-aur --noconfirm

  echo ${bold}${yellow}Pamac ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"KDEConnect - Gep es telefon link"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}KDEConnect${normal}

  sudo pacman -S kdeconnect --noconfirm

  echo ${bold}${yellow}KDEConnect ${normal}installed.
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
 --title="All Programs are Installed!" --width='300' \
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
