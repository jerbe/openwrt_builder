#!/bin/bash
#===============================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.31.1/g' openwrt/package/base-files/files/bin/config_generate

#2. 改默认WIFI SSID名
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