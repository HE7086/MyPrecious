#!/bin/bash

# reboot to windows once, next time back to linux
# require newer version of grub to support this command
# in the given example window is on the third entry
# with index 2 (starting from 0)
# this can also be used to switching between distributions

sudo grub-reboot 2
sudo reboot
