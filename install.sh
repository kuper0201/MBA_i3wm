#!/bin/bash
sudo mv 99-backlight.rules /etc/udev/rules.d/99-backlight.rules
sudo udevadm control --reload-rules
sudo udevadm trigger