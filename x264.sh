#!/usr/bin/env bash
set -euo pipefail

PREFIX="$PWD/build"
JOBS="$(nproc)"
mkdir -p "$PREFIX"

git clone http://git.videolan.org/git/x264.git x264
cd x264
CC='ccache gcc' \
CXX='ccache gcc'\
  ./configure \
    --prefix="$PREFIX" \
    --enable-static \
    --disable-opencl
make -j"$JOBS"
sudo make install
