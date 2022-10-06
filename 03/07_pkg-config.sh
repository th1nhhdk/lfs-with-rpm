#!/bin/bash
set -ex

PKGNAME=pkg-config
PKGVER=0.29.2
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.gz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr              \
                --with-internal-glib       \
                --disable-host-tool        \
                --docdir=/usr/share/doc/pkg-config-0.29.2
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
