#!/bin/bash
set -ex

# REALPKGNAME=sqlite
PKGNAME=sqlite-autoconf
PKGVER=3390200
ARCHIVEDIR=$PKGNAME-$PKGVER
ARCHIVENAME=$ARCHIVEDIR.tar.gz

pushd $LFS/sources
  tar -xf $ARCHIVENAME
  pushd $ARCHIVEDIR
    unzip -q ../sqlite-doc-3390200.zip
    ./configure --prefix=/usr     \
            --disable-static  \
            --enable-fts5     \
            CPPFLAGS="-DSQLITE_ENABLE_FTS3=1            \
                      -DSQLITE_ENABLE_FTS4=1            \
                      -DSQLITE_ENABLE_COLUMN_METADATA=1 \
                      -DSQLITE_ENABLE_UNLOCK_NOTIFY=1   \
                      -DSQLITE_ENABLE_DBSTAT_VTAB=1     \
                      -DSQLITE_SECURE_DELETE=1          \
                      -DSQLITE_ENABLE_FTS3_TOKENIZER=1"
    make
    make install
    install -v -m755 -d /usr/share/doc/sqlite-3.39.2 &&
    cp -v -R sqlite-doc-3390200/* /usr/share/doc/sqlite-3.39.2
  popd
  rm -rf $ARCHIVEDIR
popd
