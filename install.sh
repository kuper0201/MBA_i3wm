#!/bin/bash

# screen backlight
sudo mv 99-backlight.rules /etc/udev/rules.d/99-backlight.rules

# keyboard backlight
sudo mv 90-keyboard-backlight.rules /etc/udev/rules.d/90-keyboard-backlight.rules

# touchpad drag lock
# sudo mv 40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

# no intel turbo boost
sudo mv intel-noturbo.service /etc/systemd/system/intel-noturbo.service
sudo mkdir -p /opt/intel
sudo mv intel_noturbo.sh /opt/intel/intel_noturbo.sh
sudo chmod +x /opt/intel/intel_noturbo.sh
sudo systemctl enable intel-noturbo

# off thunderbolt
sudo sed -i 's/ext4/ext4 quiet splash acpi_osi=!Darwin/g' /boot/loader/entries/*_linux-zen.conf

# reload rules(or reboot manually)
sudo udevadm control --reload-rules
sudo udevadm trigger
