# Fix tearing issues on Linux with Intel Iris

## /etc/X11/xorg.conf.d
```
Section "Device"
   Identifier  "Intel Graphics"
   Driver      "intel"
   Option      "TearFree"    "true"
EndSection
```
source: https://wiki.archlinux.org/title/intel_graphics
