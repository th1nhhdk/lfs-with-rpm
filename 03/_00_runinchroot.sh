#!/bin/bash
set -ex

bash /sources/lfs-with-rpm/03/02_zlib.sh
bash /sources/lfs-with-rpm/03/03_openssl.sh
bash /sources/lfs-with-rpm/03/04_libarchive.sh
bash /sources/lfs-with-rpm/03/05_unzip.sh
bash /sources/lfs-with-rpm/03/06_sqlite.sh
bash /sources/lfs-with-rpm/03/07_pkg-config.sh
bash /sources/lfs-with-rpm/03/08_lua.sh
bash /sources/lfs-with-rpm/03/09_popt.sh
bash /sources/lfs-with-rpm/03/10_bzip2.sh
bash /sources/lfs-with-rpm/03/11_rpm.sh
exit
