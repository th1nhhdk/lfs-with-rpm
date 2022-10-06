#!/bin/bash
set -ex

if [ "$(whoami)" != "lfs" ]; then
    echo "=> ERR: This script must be run as 'lfs' user!"
    exit 1
fi

if [ -z ${LFS+x} ]; then
    echo "=> ERR: LFS variable is not set!"
    exit 1
fi

export MAKEFLAGS=-j3

bash ./00/00_binutils-stage1.sh
bash ./00/01_gcc-stage1.sh
bash ./00/02_kernel-headers.sh
bash ./00/03_glibc.sh
bash ./00/04_libstdc++.sh

bash ./01/00_m4.sh
bash ./01/01_ncurses.sh
bash ./01/02_bash.sh
bash ./01/03_coreutils.sh
bash ./01/04_diffutils.sh
bash ./01/05_file.sh
bash ./01/06_findutils.sh
bash ./01/07_gawk.sh
bash ./01/08_grep.sh
bash ./01/09_gzip.sh
bash ./01/10_make.sh
bash ./01/11_patch.sh
bash ./01/12_sed.sh
bash ./01/13_tar.sh
bash ./01/14_xz.sh
bash ./01/15_binutils-stage2.sh
bash ./01/16_gcc-stage2.sh

