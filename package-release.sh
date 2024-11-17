#!/bin/bash

set -e

shopt -s extglob

if [ -z "$1" ]; then
  echo "Usage: package-release.sh destdir"
  exit 1
fi

NVENCODEAPI_SRC_DIR=`dirname $(readlink -f $0)`
NVENCODEAPI_BUILD_DIR=$(realpath "$1")"/nvencodeapi"

if [ -e "$NVENCODEAPI_BUILD_DIR" ]; then
  echo "Build directory $NVENCODEAPI_BUILD_DIR already exists"
  exit 1
fi

# build nvencodeapi

function build_arch {
  export WINEARCH="win$1"

  cd "$NVENCODEAPI_SRC_DIR"

  meson --cross-file "$NVENCODEAPI_SRC_DIR/build-wine$1.txt"  \
        --buildtype release                                   \
        --prefix "$NVENCODEAPI_BUILD_DIR"                     \
        --libdir lib$1                                        \
	--strip                                               \
        "$NVENCODEAPI_BUILD_DIR/build.$1"

  cd "$NVENCODEAPI_BUILD_DIR/build.$1"
  ninja install

  rm -R "$NVENCODEAPI_BUILD_DIR/build.$1"
}

build_arch 64
build_arch 32

# cleanup
cd $NVENCODEAPI_BUILD_DIR
find . -name \*.a -type f -delete
mv lib32 lib
echo "Done building!"
