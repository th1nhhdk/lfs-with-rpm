#!/bin/bash
set -ex
PKG=binutils
VER=2.39
TYPE=tar.xz

pushd $LFS/sources
  tar -xf $PKG-$VER.$TYPE
  pushd $PKG-$VER
    mkdir build
    cd build
    ../configure --prefix=$LFS/tools \
                 --with-sysroot=$LFS \
                 --target=$LFS_TGT   \
                 --disable-nls       \
                 --enable-gprofng=no \
                 --disable-werror
    make
    make install
  popd
  rm -rf $PKG-$VER
popd
