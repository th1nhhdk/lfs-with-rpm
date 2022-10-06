#!/bin/bash
set -ex
PKGNAME=diffutils
PKGVER=3.8
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr --host=$LFS_TGT
    make
    make DESTDIR=$LFS install
  popd
  rm -rf $ARCHIVEDIR
popd
