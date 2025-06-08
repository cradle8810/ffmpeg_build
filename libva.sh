#!/usr/bin/env bash
set -euo pipefail

PREFIX="$PWD/build"
JOBS="$(nproc)"
mkdir -p "$PREFIX"

git clone https://github.com/intel/libva.git
cd libva
./autogen.sh --disable-shared --enable-static --prefix="$PREFIX"
make -j"$JOBS" && make install
