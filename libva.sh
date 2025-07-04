#!/usr/bin/env bash
set -euo pipefail

JOBS="$(nproc)"


git clone https://github.com/intel/libva.git
cd libva
CC='ccache gcc' \
CXX='ccache gcc' \
CFLAGS="-O2 -fPIC" \
CXXFLAGS="-O2 -fPIC" \
  ./autogen.sh \
    --disable-shared \
    --enable-static
make -j"$JOBS"
sudo make install
