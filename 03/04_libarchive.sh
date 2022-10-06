#!/bin/bash
set -ex

PKGNAME=libarchive
PKGVER=3.6.1
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    sed '/linux\/fs\.h/d' -i libarchive/archive_read_disk_posix.c
    ./configure --prefix=/usr --disable-static
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
