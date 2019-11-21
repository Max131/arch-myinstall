#!/bin/bash

timedatectl set-ntp true
clear
echo "##### Instalando sistema base #####"
sleep 2s
pacstrap /mnt base base-devel linux-zen linux-zen-headers linux-firmware grub os-prober networkmanager vim mlocate sudo zsh pulseaudio pulsemixer alsa-utils unzip unrar nethogs man-db man-pages amd-ucode arch-wiki-lite arch-wiki-docs

clear
echo "##### Instalando X y Openbox #####"
sleep 2s
pacstrap /mnt xorg-server xorg-xinit xorg-xrandr xorg-xkill xf86-input-libinput xf86-video-amdgpu terminus-font lightdm lightdm-gtk-greeter accountsservice openbox obconf nitrogen tint2 jgmenu elementary-icon-theme arc-gtk-theme lxappearance lxtask guake volumeicon parcellite picom file-roller ttf-droid ttf-roboto ttf-fira-code ttf-inconsolata ttf-opensans firefox-i18n-es-mx network-manager-applet xcape xdotool gsimplecal evince libreoffice-fresh libreoffice-fresh-es gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gvfs gvfs-mtp gvfs-nfs xdg-user-dirs gmrun vlc code filezilla qbittorrent telegram-desktop gparted htop gpick sk1 gimp conky-manager geary pantheon-calculator pantheon-music pantheon-videos pantheon-calendar pantheon-photos pantheon-code pantheon-screenshot pantheon-terminal pantheon-files pantheon-polkit-agent dunst git lxmenu-data nicotine+ htop qt5ct

genfstab -U /mnt >> /mnt/etc/fstab
cp post-install.sh /mnt/root/
echo "Cambiando a chroot /mnt"
echo "Conituna ejecutando el script post-install.sh en /roo"

arch-chroot /mnt
