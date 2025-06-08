#!/usr/bin/env bash
set -euo pipefail

PREFIX="$PWD/build"
mkdir -p "$PREFIX"

git clone https://gitlab.freedesktop.org/mesa/drm.git libdrm
cd libdrm
meson setup build -Ddrm_tests=false -Dshared_library=false --prefix="$PREFIX"
ninja -C build && ninja -C build install
