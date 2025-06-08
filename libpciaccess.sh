#!/usr/bin/env bash
set -euo pipefail

JOBS="$(nproc)"

git clone https://github.com/projectceladon/libpciaccess
cd libpciaccess
CC='ccache gcc' \
CXX='ccache gcc'\
  ./autogen.sh \
    --disable-shared \
    --enable-static
make -j"$JOBS"
sudo make install
