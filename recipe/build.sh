#!/bin/bash

set -e

# use out-of-tree build
mkdir -pv _build
cd _build

# configure
${SRC_DIR}/configure \
	--disable-doxygen \
	--disable-gcc-flags \
	--disable-python \
	--disable-swig-octave \
	--disable-swig-python \
	--enable-framec \
	--enable-framel \
	--enable-help2man \
	--enable-swig-iface \
	--prefix="${PREFIX}" \
;

# build
make -j ${CPU_COUNT} V=1 VERBOSE=1

# test
make -j ${CPU_COUNT} V=1 VERBOSE=1 check
