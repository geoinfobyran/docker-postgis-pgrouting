#!/bin/sh

set -e

tar xvfz pgrouting-2.6.1.tar.gz
cd pgrouting-2.6.1
mkdir build
cd build
cmake  ..
make
make install