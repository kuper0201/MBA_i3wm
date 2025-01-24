#!/bin/bash

sudo pacman -Syu pulseaudio

# screen backlight
sudo mv 99-backlight.rules /etc/udev/rules.d/99-backlight.rules

# keyboard backlight
sudo mv 90-keyboard-backlight.rules /etc/udev/rules.d/90-keyboard-backlight.rules

# touchpad drag lock
sudo mv 40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

# reload rules(or reboot manually)
sudo udevadm control --reload-rules
sudo udevadm trigger
