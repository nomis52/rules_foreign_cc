#!/bin/bash

# This script is triggered from the script section of .travis.yml
# It runs the appropriate commands depending on the task requested.

set -e

tests=(
    configure_with_bazel_transitive
    simple_make
    use_malloc
)

cd examples

for example in "${tests[@]}"; do
  pushd .
  bazel test "//$example/..."
  popd .
done
