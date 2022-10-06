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
        sed -e '/m64=/s/lib64/lib/' \
            -i.orig gcc/config/i386/t-linux64
     ;;
    esac
    mkdir build
    cd build
    ../configure                  \
	--target=$LFS_TGT         \
	--prefix=$LFS/tools       \
	--with-glibc-version=2.36 \
	--with-sysroot=$LFS       \
	--with-newlib             \
	--without-headers         \
	--disable-nls             \
	--disable-shared          \
	--disable-multilib        \
	--disable-decimal-float   \
	--disable-threads         \
	--disable-libatomic       \
	--disable-libgomp         \
	--disable-libquadmath     \
	--disable-libssp          \
	--disable-libvtv          \
	--disable-libstdcxx       \
	--enable-languages=c,c++
    make
    make install
    cd ..
    cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
      `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h
  popd
  rm -rf $ARCHIVEDIR
popd
