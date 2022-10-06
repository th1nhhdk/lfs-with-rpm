#!/bin/bash
set -ex
PKGNAME=binutils
PKGVER=2.39
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    sed '6009s/$add_dir//' -i ltmain.sh
    mkdir build
    cd build
    ../configure                   \
        --prefix=/usr              \
        --build=$(../config.guess) \
        --host=$LFS_TGT            \
        --disable-nls              \
        --enable-shared            \
        --enable-gprofng=no        \
        --disable-werror           \
        --enable-64-bit-bfd
    make
    make DESTDIR=$LFS install
    rm $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}
  popd
  rm -rf $ARCHIVEDIR
popd
