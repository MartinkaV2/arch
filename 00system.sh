#!/bin/sh

sudo pacman -S zenity flatpak gnome-software neofetch --noconfirm

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