#!/bin/bash
set -ex

PKGNAME=popt
PKGVER=1.19
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.gz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr --disable-static
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
