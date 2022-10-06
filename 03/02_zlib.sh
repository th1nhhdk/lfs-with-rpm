#!/bin/bash
set -ex

PKGNAME=zlib
PKGVER=1.2.12
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr
    make
    make install
    rm -fv /usr/lib/libz.a
  popd
  rm -rf $ARCHIVEDIR
popd
