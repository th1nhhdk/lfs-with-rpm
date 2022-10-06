#!/bin/bash
set -ex
PKGNAME=texinfo
PKGVER=6.8
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd /sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
