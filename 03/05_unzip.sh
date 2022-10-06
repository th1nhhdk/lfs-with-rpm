#!/bin/bash
set -ex

PKGNAME=unzip
PKGVER=60
ARCHIVEDIR=$PKGNAME$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.gz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    patch -Np1 -i ../unzip-6.0-consolidated_fixes-1.patch
    make -f unix/Makefile generic
    make prefix=/usr MANDIR=/usr/share/man/man1 \
      -f unix/Makefile install
  popd
  rm -rf $ARCHIVEDIR
popd
