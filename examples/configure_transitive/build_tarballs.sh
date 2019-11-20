#!/bin/bash

set -euxo pipefail

# This script builds tarballs for the three libraries.
# This is done so that bazel uses the dist tarballs rather than trying to
# build from the maintainer sources.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function build_lib() {
  # Builds & creates the dist tarball for the given lib.
  # Make
  local lib="$1"
  shift;

  pushd .
  cd "$DIR/$lib"
  autoreconf -fi
  ./configure $@
  make dist

  tarball=$(ls -t $lib*.tar.gz| head -n1)
  cp "$tarball" /tmp
  popd
}

build_lib liblength ""
build_lib libarea --without-liblength
build_lib libvolume --without-libarea
