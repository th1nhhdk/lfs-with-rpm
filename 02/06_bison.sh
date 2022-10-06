#!/bin/bash
set -ex
PKGNAME=bison
PKGVER=3.8.2
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd /sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr \
                --docdir=/usr/share/doc/bison-3.8.2
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
