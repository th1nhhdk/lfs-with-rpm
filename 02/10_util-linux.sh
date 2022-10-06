#!/bin/bash
set -ex
PKGNAME=util-linux
PKGVER=2.38.1
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd /sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    mkdir -p /var/lib/hwclock
    ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime     \
                --libdir=/usr/lib                         \
                --docdir=/usr/share/doc/util-linux-2.38.1 \
                --disable-chfn-chsh                       \
                --disable-login                           \
                --disable-nologin                         \
                --disable-su                              \
                --disable-setpriv                         \
                --disable-runuser                         \
                --disable-pylibmount                      \
                --disable-static                          \
                --without-python                          \
                runstatedir=/run
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
