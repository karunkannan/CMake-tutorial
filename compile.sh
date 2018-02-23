#!/bin/bash

cd opencv/
rm -rf build/
mkdir build/
cd build/

#invoke cmake
cmake ../superbuild/
make
