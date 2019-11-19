#!/bin/bash

for lib in liblength libarea libvolume; do
  pushd .
  cd $lib
  autoreconf -fi
  popd
done
