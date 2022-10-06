#!/bin/bash
set -ex
PKGNAME=Python
PKGVER=3.10.7
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd /sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr   \
                --enable-shared \
                --without-ensurepip
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
