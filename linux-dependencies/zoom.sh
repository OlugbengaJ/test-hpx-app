#!/usr/bin/env bash

for filename in ./*.sh; do
  chmod +x "$filename"
done

# https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux

LIST_OF_DEPENDENCIES="libglib2.0-0 libgstreamer-plugins-base0.10-0 libxcb-shape0 libxcb-shm0 libxcb-xfixes0 libxcb-randr0 libxcb-image0 libfontconfig1 libgl1-mesa-glx libxi6 libsm6 libxrender1 libpulse0 libxcomposite1 libxslt1.1 libsqlite3-0 libxcb-keysyms1 libxcb-xtest0 ibus"


sudo apt update -y

sudo apt install -y "$LIST_OF_DEPENDENCIES"