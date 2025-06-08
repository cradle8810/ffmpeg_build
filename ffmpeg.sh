#!/usr/bin/env bash
set -euo pipefail

PREFIX="$PWD/build"
JOBS="$(nproc)"
mkdir -p "$PREFIX"

git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
cd ffmpeg
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH CFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib"
./configure \
  --prefix="$PREFIX" \
  --pkg-config-flags="--static" \
  --extra-cflags="$CFLAGS" \
  --extra-ldflags="$LDFLAGS" \
  --extra-libs="-lm -lpthread" \
  --enable-gpl \
  --enable-nonfree \
  --enable-libx264 \
  --enable-libmfx \
  --enable-vaapi \
  --disable-shared \
  --enable-static
make -j"$JOBS" && make install
