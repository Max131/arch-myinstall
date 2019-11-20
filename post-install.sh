#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc
echo "es_MX.UTF-8" > /etc/locale.gen
echo "es_MX ISO-8859-1" >> /etc/locale.gen
locale-gen
echo "LANG=es_MX.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
echo "max" > /etc/hostname
echo "127.0.0.1		max" >> /etc/hosts
echo "::1			max" >> /etc/hosts
echo "127.0.0.1		max.localdomain		max" >> /etc/hosts
mkinitcpio -P
passwd
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
useradd -u 1001 -m -G audio,video,optical,storage,disk,lp,wheel,users,network,power m13
passwd m13
echo "EDITOR=vim" >> /etc/environment
echo "BROWSER=firefox" >> /etc/environment
echo "tint2 &" >> /etc/xdg/openbox/autostart
echo "guake &" >> /etc/xdg/openbox/autostart
echo "nm-applet &" >> /etc/xdg/openbox/autostart
echo "parcellite &" >> /etc/xdg/openbox/autostart
echo "volumeicon &" >> /etc/xdg/openbox/autostart
echo "export XDG_CURRENT_DESKTOP=openbox" >> /etc/xdg/openbox/environment
