#!/bin/bash
set -euo pipefail

# Ship Argon as the default LuCI theme. The package selection alone only
# installs the theme and otherwise leaves LuCI using Bootstrap.
sed -i "s|option mediaurlbase '/luci-static/bootstrap'|option mediaurlbase '/luci-static/argon'|" \
  feeds/luci/modules/luci-base/root/etc/config/luci

rm -rf package/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git /tmp/OpenClash
cp -a /tmp/OpenClash/luci-app-openclash package/luci-app-openclash

mkdir -p package/luci-app-openclash/root/etc/openclash/core
curl --fail --location --retry 3 \
  https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz \
  -o /tmp/openclash-core.tar.gz
tar -xzf /tmp/openclash-core.tar.gz -C /tmp
install -m 0755 /tmp/clash package/luci-app-openclash/root/etc/openclash/core/clash_meta

rm -rf package/luci-app-filemanager /tmp/luci-upstream
git clone --depth=1 https://github.com/openwrt/luci.git /tmp/luci-upstream
cp -a /tmp/luci-upstream/applications/luci-app-filemanager package/luci-app-filemanager
