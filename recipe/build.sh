#!/bin/bash

set -e

# configure
./configure \
	--prefix="${PREFIX}" \
	--disable-gcc-flags \
	--disable-python \
	--disable-swig-octave \
	--disable-swig-python \
	--enable-silent-rules \
	--enable-swig-iface \
;

# build
make -j ${CPU_COUNT}

# test
make -j ${CPU_COUNT} check

# install
make -j ${CPU_COUNT} install
