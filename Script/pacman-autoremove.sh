#!/bin/bash

# pacman equivalence of apt autoremove

pacman -Qdtq | sudo pacman -Rs -
