#!/bin/bash

# deepin-wine wechat settings

if [[ $1 = regedit ]]; then
    WINEPREFIX=~/.deepinwine/Deepin-WeChat deepin-wine regedit
elif [[ $1 = winecfg ]]; then
    WINEPREFIX=~/.deepinwine/Deepin-WeChat deepin-wine winecfg
else
    echo "usage: regedit    --registry editor"
    echo "       winecfg    --wine configuration"
fi
