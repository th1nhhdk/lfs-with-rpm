#!/bin/bash
set -ex

if [ -z ${LFS+x} ]; then
    echo "=> ERR: LFS variable is not set!"
    exit 1
fi

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login           \
              -c "bash /sources/lfs-with-rpm/03/_00_runinchroot.sh"
