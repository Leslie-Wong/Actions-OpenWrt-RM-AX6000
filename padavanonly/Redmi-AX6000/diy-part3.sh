cd openwrt/feeds/luci/applications
rm -rf luci-app-passwall
cd ../../..
git pull
./scripts/feeds update -a
./scripts/feeds install -a
