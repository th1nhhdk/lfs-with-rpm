#!/bin/bash
set -ex

if [ -z ${LFS+x} ]; then
    echo "=> ERR: LFS variable is not set!"
    exit 1
fi

PKGNAME=m4
PKGVER=1.4.19
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr   \
	              --host=$LFS_TGT \
		            --build=$(build-aux/config.guess)
    make
    make DESTDIR=$LFS install
  popd
  rm -rf $ARCHIVEDIR
popd
