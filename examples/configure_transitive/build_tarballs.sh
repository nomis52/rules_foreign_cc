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
  local inst_dir="$2"
  shift 2;

  pushd .
  cd "$DIR/$lib"
  autoreconf -fi
  ./configure $@

  if [ x"${inst_dir}" != x ]; then
    make
    make install DESTDIR=$inst_dir
  fi
  make dist

  tarball=$(ls -t $lib*.tar.gz| head -n1)
  cp "$tarball" /tmp
  popd
}

instdir=$(mktemp -d)
build_lib liblength $instdir

libarea_inst=$(mktemp -d)
build_lib libarea $instdir CFLAGS=-I$instdir/usr/local/include/ LDFLAGS=-L$instdir/usr/local/lib

build_lib libvolume "" CFLAGS=-I$instdir/usr/local/include/ LDFLAGS=-L$instdir/usr/local/lib
