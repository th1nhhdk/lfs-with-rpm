#!/bin/bash
set -ex

if [ -z ${LFS+x} ]; then
    echo "=> ERR: LFS variable is not set!"
    exit 1
fi

PKGNAME=gcc
PKGVER=12.2.0
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    mkdir build
    cd build
    ../libstdc++-v3/configure      \
        --host=$LFS_TGT            \
        --build=$(../config.guess) \
        --prefix=/usr              \
        --disable-multilib         \
        --disable-nl               \
        --disable-libstdcxx-pch    \
        --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/12.2.0
    make
    make DESTDIR=$LFS install
    rm $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la
  popd
  rm -rf $ARCHIVEDIR
popd
