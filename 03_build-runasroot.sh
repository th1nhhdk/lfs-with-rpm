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

bash ./03/00_preparevirtualkernelfs.sh
bash ./03/01_chroot.sh
