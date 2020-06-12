#!/bin/bash

# fix for firacode that it is not detected as monospaced font
# force its spacing property to be 100

sudo echo '
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<match target="scan">
    <test name="family">
      <string>Fira Code</string>
    </test>
    <edit name="spacing">
      <int>100</int>
    </edit>
  </match>
</fontconfig>
' >> /etc/fonts/conf.avail/80-firacode-spacing.conf

sudo ln -sf /etc/fonts/conf.avail/80-firacode-spacing.conf /etc/fonts/conf.d/
