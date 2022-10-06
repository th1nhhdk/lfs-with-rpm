#!/bin/bash
set -ex

PKGNAME=rpm
PKGVER=4.18.0
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.bz2

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr             \
                --sysconfdir=/etc         \
                --sharedstatedir=/var/lib \
                --localstatedir=/var      \
                --enable-ndb              \
                --enable-python           \
                --disable-inhibit-plugin  \
                --with-crypto=openssl
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
