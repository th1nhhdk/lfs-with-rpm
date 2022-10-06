#!/bin/bash
set -ex

touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp utmp /var/log/lastlog
chmod 664  /var/log/lastlog
chmod 600  /var/log/btmp

bash /sources/lfs-with-rpm/02/05_gettext.sh
bash /sources/lfs-with-rpm/02/06_bison.sh
bash /sources/lfs-with-rpm/02/07_perl.sh
bash /sources/lfs-with-rpm/02/08_python.sh
bash /sources/lfs-with-rpm/02/09_texinfo.sh
bash /sources/lfs-with-rpm/02/10_util-linux.sh
bash /sources/lfs-with-rpm/02/11_cleanandsavetempsys.sh
