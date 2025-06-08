#!/usr/bin/env bash
set -euo pipefail

PREFIX="$PWD/build"
JOBS="$(nproc)"
mkdir -p "$PREFIX"

git clone https://github.com/Intel-Media-SDK/MediaSDK.git mediasdk
cd mediasdk
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="$PREFIX" \
      -DBUILD_SHARED_LIBS=0 .
make -j"$JOBS" && make install
