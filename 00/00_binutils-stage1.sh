#!/bin/bash
set -ex

if [ -z ${LFS+x} ]; then
    echo "=> ERR: LFS variable is not set!"
    exit 1
fi

PKGNAME=binutils
PKGVER=2.39
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
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
  rm -rf $ARCHIVEDIR
popd
