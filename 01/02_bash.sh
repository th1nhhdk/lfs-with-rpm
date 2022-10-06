#!/bin/bash
set -ex
PKGNAME=bash
PKGVER=5.1.16
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.gz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --prefix=/usr                   \
                --build=$(support/config.guess) \
                --host=$LFS_TGT                 \
                --without-bash-malloc
    make
    make DESTDIR=$LFS install
    ln -s bash $LFS/bin/sh
  popd
  rm -rf $ARCHIVEDIR
popd
