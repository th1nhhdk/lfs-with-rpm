#!/bin/bash
set -ex

if ! [ $(id -u) = 0 ]; then
   echo "=> ERR: This script must be run as root!"
   exit 1
fi

if [ -z ${LFS+x} ]; then
    echo "=> ERR: LFS variable is not set!"
    exit 1
fi

umount $LFS/dev/pts
umount $LFS/{sys,proc,run,dev}
cd $LFS
tar -cJpvf $HOME/lfs-with-rpm-11.2.tar.xz .
