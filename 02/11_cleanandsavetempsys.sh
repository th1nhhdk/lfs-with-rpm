#!/bin/bash
set -ex

find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools
exit