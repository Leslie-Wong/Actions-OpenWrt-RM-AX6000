#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
##-----------------Add OpenClash dev core------------------
curl -sL -m 30 --retry 2 https://raw.githubusercontent.com/vernesong/OpenClash/master/core-lateset/dev/clash-linux-arm64.tar.gz -o /tmp/clash.tar.gz
tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
chmod +x /tmp/clash >/dev/null 2>&1
mkdir -p feeds/luci/applications/luci-app-openclash/root/etc/openclash/core
mv /tmp/clash feeds/luci/applications/luci-app-openclash/root/etc/openclash/core/clash >/dev/null 2>&1
rm -rf /tmp/clash.tar.gz >/dev/null 2>&1
##---------------------------------------------------------

cd $GITHUB_WORKSPACE/openwrt/feeds/packages/lang
rm -rf golang && svn co https://github.com/openwrt/packages/branches/openwrt-22.03/lang/golang

# cd $GITHUB_WORKSPACE/openwrt/feeds/packages/net
# rm -rf brook chinadns-ng dns2socks dns2tcp gn hysteria ipt2socks microsocks naiveproxy pdnsd-alt shadowsocks-rust shadowsocksr-libev simple-obfs sing-box ssocks tcping trojan-go trojan-plus trojan v2raya v2ray-core v2ray-geodata v2ray-plugin xray-core xray-plugin
# rm -rf $GITHUB_WORKSPACE/openwrt/feeds/luci/applications/luci-app-passwall
# git clone https://github.com/xiaorouji/openwrt-passwall.git
# mv openwrt-passwall/* $GITHUB_WORKSPACE/openwrt/feeds/packages/net
# rm -rf openwrt-passwall

# cd $GITHUB_WORKSPACE/openwrt/feeds/luci/applications
# git clone https://github.com/Leslie-Wong/luci-app-passwall.git

cd $GITHUB_WORKSPACE/openwrt/feeds/luci/applications
rm -rf luci-app-passwall
git clone https://github.com/Leslie-Wong/luci-app-passwall-18.03.git luci-app-passwall

#cd $GITHUB_WORKSPACE/openwrt
#./scripts/feeds install -a -f -p PWpackages
#./scripts/feeds install luci-app-passwall
