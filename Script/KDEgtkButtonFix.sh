#!/bin/bash

# after installing xsettingsd or gnome-settings-daemon on kde
# gtk applications may have their buttons missing

gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

