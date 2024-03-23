# Fix media not loading on Firefox Linux with Intel Iris XE

## Fedora
```sh
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-plugin-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf install lame\* --exclude=lame-devel

sudo dnf group upgrade --with-optional Multimedia
```
source: https://docs.fedoraproject.org/en-US/quick-docs/installing-plugins-for-playing-movies-and-music/
