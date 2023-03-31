#!/bin/bash
#===============================================
# 修改默认IP
sed -i 's/192.168.1.1/192.168.31.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改默认主机名
sed -i "s/hostname='OpenWrt'/hostname='J-Router'/g" openwrt/package/base-files/files/bin/config_generate

# 修改默认时区
sed -i "s/timezone='UTC'/timezone='CST-8'/g" openwrt/package/base-files/files/bin/config_generate

# 改默认WIFI SSID名
sed -i 's/ssid=OpenWrt/ssid=D-WiFi/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7612.dat
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7615.1.2G.dat
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7615.1.5G.dat
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7615.2G.dat
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7615.5G.dat
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7615.dat
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7915.1.2G.dat
sed -i 's/SSID1=OpenWrt/SSID1=D-WiFi/g' openwrt/package/lean/mt/drivers/mt_wifi/files/mt7915.1.5G.dat

# 添加对armvirt的自动内核支持
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# 修改发布版本号
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y%m.%d.%H%M)'|g" package/lean/default-settings/files/zzz-default-settings