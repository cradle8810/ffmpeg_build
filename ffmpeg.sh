#!/usr/bin/env bash
set -euo pipefail

PREFIX="$PWD/build"
JOBS="$(nproc)"
mkdir -p "$PREFIX"

git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg-source
cd ffmpeg-source
CC='ccache gcc' \
CXX='ccache gcc'\
  ./configure \
    --prefix="$PREFIX" \
    --pkg-config-flags="--static" \
    --extra-libs="-lm -lpthread" \
    --enable-gpl \
    --enable-nonfree \
    --enable-libx264 \
    --enable-libmfx \
    --enable-vaapi \
    --disable-shared \
    --enable-static
make -j"$JOBS"
