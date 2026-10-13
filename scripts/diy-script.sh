#!/bin/bash
set -euo pipefail

grep -q '^src-git istore ' feeds.conf.default || \
  echo 'src-git istore https://github.com/linkease/istore.git;main' >> feeds.conf.default

sed -i 's/192\.168\.[0-9]*\.[0-9]*/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i -E 's|^root:[^:]*:|root::|' package/base-files/files/etc/shadow

