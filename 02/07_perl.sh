#!/bin/bash
set -ex
PKGNAME=bison
PKGVER=3.8.2
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.xz

pushd /sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    sh Configure -des                                        \
                 -Dprefix=/usr                               \
                 -Dvendorprefix=/usr                         \
                 -Dprivlib=/usr/lib/perl5/5.36/core_perl     \
                 -Darchlib=/usr/lib/perl5/5.36/core_perl     \
                 -Dsitelib=/usr/lib/perl5/5.36/site_perl     \
                 -Dsitearch=/usr/lib/perl5/5.36/site_perl    \
                 -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl \
                 -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl
    make
    make install
  popd
  rm -rf $ARCHIVEDIR
popd
