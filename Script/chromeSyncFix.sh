#!/bin/bash

# chrome may somehow not sync correctly
# delete the following files and restart browser should fix
# checkout the sync status here: chrome://sync-internals


if [[ -d "$HOME/.config/google-chrome" ]]; then

rm ~/.config/google-chrome/Default/'Login Data'
rm ~/.config/google-chrome/Default/'Login Data-journal'

elif [[ -d "$HOME/.config/chromium" ]]; then

rm ~/.config/chromium/Default/'Login Data'
rm ~/.config/chromium/Default/'Login Data-journal'

fi
