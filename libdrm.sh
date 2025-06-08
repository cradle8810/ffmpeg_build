#!/usr/bin/env bash
set -euo pipefail

git clone https://gitlab.freedesktop.org/mesa/drm.git libdrm
cd libdrm
sudo meson setup build \
  -D default_library=static \
  -D intel=enabled \
  -D tests=false \
  -D udev=true
sudo ninja -C build
sudo ninja -C build install
