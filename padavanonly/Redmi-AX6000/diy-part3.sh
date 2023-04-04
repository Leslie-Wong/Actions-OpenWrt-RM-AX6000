cd openwrt/feeds/luci/applications
rm -rf luci-app-passwall
cd ../../..
git pull
./scripts/feeds update -a
./scripts/feeds install -a
cd $GITHUB_WORKSPACE/openwrt/feeds/kenzo
rm -rf luci-app-passwall
git clone https://github.com/Leslie-Wong/openwrt-passwall -b luci
mv openwrt-passwall/luci-app-passwall luci-app-passwall
rm -rf openwrt-passwall
