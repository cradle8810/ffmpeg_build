#!/usr/bin/env bash
set -euo pipefail

JOBS="$(nproc)"

if [ ! -d media-driver/build ]; then
  mkdir -p media-driver/build
fi

export CC="ccache gcc"
export CXX="ccache g++"
export CMAKE_BUILD_PARALLEL_LEVEL="$JOBS"

cd media-driver/build
cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=0 \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
  -DCMAKE_BUILD_PARALLEL_LEVEL="$JOBS" \
  ..
make -j"$JOBS"
sudo make install
