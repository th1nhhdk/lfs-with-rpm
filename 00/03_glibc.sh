#!/bin/bash
set -ex
PKGNAME=glibc
PKGVER=2.36
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    case $(uname -m) in
        i?86)   ln -sf ld-linux.so.2 $LFS/lib/ld-lsb.so.3
        ;;
        x86_64) ln -sf ../lib/ld-linux-x86-64.so.2 $LFS/lib64
                ln -sf ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
        ;;
    esac
    patch -Np1 -i ../glibc-2.36-fhs-1.patch
    mkdir build
    cd build
    echo "rootsbindir=/usr/sbin" > configparms
    ../configure                             \
	        --prefix=/usr                      \
	        --host=$LFS_TGT                    \
	        --build=$(../scripts/config.guess) \
	        --enable-kernel=3.2                \
	        --with-headers=$LFS/usr/include    \
	        libc_cv_slibdir=/usr/lib
    make
    make DESTDIR=$LFS install
    sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
    echo 'int main(){}' | gcc -xc -
    readelf -l a.out | grep ld-linux
    rm a.out
    $LFS/tools/libexec/gcc/$LFS_TGT/12.2.0/install-tools/mkheaders
  popd
  rm -rf $ARCHIVEDIR
popd
