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

bash ./02/00_changeownership.sh
bash ./02/01_preparevirtualkernelfs.sh
bash ./02/02_chroot.sh
