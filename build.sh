#!/bin/bash

TYPE="Release"

if [ "$#" != 0 ]; then
    TYPE="$1"
fi

echo "Building $TYPE"

cd build
cmake -DCMAKE_BUILD_TYPE="$TYPE" "${@:1}" ..
make -j 4