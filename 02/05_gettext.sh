#!/bin/bash
set -ex
PKGNAME=gettext
PKGVER=0.21
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd /sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    ./configure --disable-shared
    make
    cp gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
  popd
  rm -rf $ARCHIVEDIR
popd
