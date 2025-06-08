#!/usr/bin/env bash
set -euo pipefail

PREFIX="$PWD/build"
JOBS="$(nproc)"
mkdir -p "$PREFIX"

git clone http://git.videolan.org/git/x264.git x264
cd x264
./configure --prefix="$PREFIX" --enable-static --disable-shared --disable-opencl
make -j"$JOBS" && make install
