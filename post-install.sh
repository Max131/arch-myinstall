#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc
sed -i 's/# es_MX/es_MX/g' /etc/locale.gen
#echo "es_MX.UTF-8 UTF-8" > /etc/locale.gen
#echo "es_MX ISO-8859-1" >> /etc/locale.gen
locale-gen
echo "LANG=es_MX.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" >> /etc/vconsole.conf
echo "FONT=ter-i18n" >> /etc/vconsole.conf
cp -f X/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
cp -Rf skel /etc/

read -p "¿Nombre del PC? [max]: " myhost
myhost=${myhost:-max}

echo $myhost > /etc/hostname
echo "127.0.0.1		$myhost" >> /etc/hosts
echo "::1			$myhost" >> /etc/hosts
echo "127.0.0.1		$myhost.localdomain		$myhost" >> /etc/hosts

sed -i 's/HOOKS=(base udev autodetect modconf block filesystems keyboard fsck/HOOKS=(base udev autodetect modconf block filesystems keyboard fsck consolefont/g' /etc/mkinitcpio.conf

mkinitcpio -P

echo "##########################################"
echo "#### Configurando contraseña de root  ####"
echo "##########################################"

passwd

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager

read -p "¿Nombre de usuario? [m13]: " myuser
myuser=${myuser:-m13}

useradd -u 1001 -m -G audio,video,optical,storage,disk,lp,wheel,users,network,power $myuser

echo "##########################################"
echo "## Configurando contraseña del usuarop ###"
echo "##########################################"

passwd $myuser

echo "EDITOR=vim" >> /etc/environment
echo "BROWSER=firefox" >> /etc/environment

cat>/etc/xdg/openbox/autostart<<EOF -
tint2 &
guake &
nm-applet &
parcellite &
volumeicon &
EOF

echo "export XDG_CURRENT_DESKTOP=openbox" >> /etc/xdg/openbox/environment
