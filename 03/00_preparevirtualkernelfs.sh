#!/bin/bash
set -ex

if [ -z ${LFS+x} ]; then
    echo "=> ERR: LFS variable is not set!"
    exit 1
fi

mount --bind /dev $LFS/dev
mount --bind /dev/pts $LFS/dev/pts
mount -t proc proc $LFS/proc
mount -t sysfs sysfs $LFS/sys
mount -t tmpfs tmpfs $LFS/run
