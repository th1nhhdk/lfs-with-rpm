#!/bin/bash
set -ex
PKGNAME=ncurses
PKGVER=6.3
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.gz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    sed -i s/mawk// configure
    mkdir build
    pushd build
      ../configure
      make -C include
      make -C progs tic
    popd
    ./configure --prefix=/usr                \
	              --host=$LFS_TGT              \
		            --build=$(./config.guess)    \
		            --mandir=/usr/share/man      \
		            --with-manpage-format=normal \
		            --with-shared                \
		            --without-normal             \
		            --with-cxx-shared            \
		            --without-debug              \
		            --without-ada                \
		            --disable-stripping          \
		            --enable-widec
    make
    make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
    echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so
  popd
  rm -rf $ARCHIVEDIR
popd
