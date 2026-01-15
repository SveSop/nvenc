#!/bin/bash

set -e

shopt -s extglob

if [ $# -lt 2 ]; then
  echo "Usage: $0 releasename destdir [--fakedll]"
  exit 1
fi

VERSION="$1"
DESTDIR="$2"
NVENC_SRC_DIR=$(dirname "$(readlink -f "$0")")
NVENC_BUILD_DIR=$(realpath "$2")"/nvenc-$VERSION"
shift 2

FAKEDLL=""
LIBDIR='x64'

for arg in "$@"; do
  case "$arg" in
    --fakedll)
      FAKEDLL="-Dfakedll=true"
      LIBDIR='lib'
      ;;
    *)
      echo "Error: unknown option '$arg'"
      exit 1
      ;;
  esac
done

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
      --libdir $LIBDIR                                \
      --strip                                         \
      $FAKEDLL                                        \
      "$NVENC_BUILD_DIR/build.64"

cd "$NVENC_BUILD_DIR/build.64"
ninja install

rm -R "$NVENC_BUILD_DIR/build.64"

# cleanup
cd $NVENC_BUILD_DIR
find . -name \*.a -type f -delete
if [ -z "$FAKEDLL" ]; then
  find . -name "*.dll.so" -type f -exec bash -c 'mv "$0" "${0%.so}"' {} \;
fi
echo "Done building!"
