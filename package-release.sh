#!/bin/bash

set -e

shopt -s extglob

if [ -z "$1" ]; then
  echo "Usage: package-release.sh destdir"
  exit 1
fi

NVENC_SRC_DIR=`dirname $(readlink -f $0)`
NVENC_BUILD_DIR=$(realpath "$1")"/nvenc"

if [ -e "$NVENC_BUILD_DIR" ]; then
  echo "Build directory $NVENC_BUILD_DIR already exists"
  exit 1
fi

# build nvencodeapi

cd "$NVENC_SRC_DIR"

meson setup                                           \
      --cross-file "$NVENC_SRC_DIR/build-wine64.txt"  \
      --buildtype release                             \
      --prefix "$NVENC_BUILD_DIR"                     \
      --libdir "x64"                                  \
      --strip                                         \
      "$NVENC_BUILD_DIR/build.64"

cd "$NVENC_BUILD_DIR/build.64"
ninja install

rm -R "$NVENC_BUILD_DIR/build.64"

# cleanup
cd $NVENC_BUILD_DIR
find . -name \*.a -type f -delete
find . -name "*.dll.so" -type f -exec bash -c 'mv "$0" "${0%.so}"' {} \;
echo "Done building!"
