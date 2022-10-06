#!/bin/bash
set -ex

if [ -z ${LFS+x} ]; then
    echo "=> ERR: LFS variable is not set!"
    exit 1
fi

PKGNAME=linux
PKGVER=5.19.2
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    make mrproper
    make headers
    find usr/include -type f ! -name '*.h' -delete
    cp -r usr/include $LFS/usr
  popd
  rm -rf $ARCHIVEDIR
popd
