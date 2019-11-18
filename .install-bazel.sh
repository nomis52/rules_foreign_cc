#!/bin/bash

# This script installs bazel for the platform. It's called by travis.

set -e

release=$(curl -sL https://api.github.com/repos/bazelbuild/bazel/releases/latest | jq -r '.assets[].browser_download_url'| grep '.deb$')
deb=$(dirname $release)
wget "$release"
wget "$release.sha256"

sha256sum -c "$deb.sha256"
sudo dpkg -i "$deb"
