#!/bin/bash
set -ex
PKGNAME=gcc
PKGVER=12.2.0
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    tar -xf ../mpfr-4.1.0.tar.xz
    mv mpfr-4.1.0 mpfr
    tar -xf ../gmp-6.2.1.tar.xz
    mv gmp-6.2.1 gmp
    tar -xf ../mpc-1.2.1.tar.gz
    mv mpc-1.2.1 mpc
    case $(uname -m) in
      x86_64)
        sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
      ;;
    esac
    sed '/thread_header =/s/@.*@/gthr-posix.h/' \
        -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in
    mkdir build
    cd build
    ../configure                                  \
        --build=$(../config.guess)                \
        --host=$LFS_TGT                           \
        --target=$LFS_TGT                         \
        LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc \
        --prefix=/usr                             \
        --with-build-sysroot=$LFS                 \
        --enable-initfini-array                   \
        --disable-nls                             \
        --disable-multilib                        \
        --disable-decimal-float                   \
        --disable-libatomic                       \
        --disable-libgomp                         \
        --disable-libquadmath                     \
        --disable-libssp                          \
        --disable-libvtv                          \
        --enable-languages=c,c++
    make
    make DESTDIR=$LFS install
    ln -s gcc $LFS/usr/bin/cc
  popd
  rm -rf $ARCHIVEDIR
popd
