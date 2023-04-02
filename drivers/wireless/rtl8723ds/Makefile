include $(TOPDIR)/rules.mk

PKG_NAME:=rtl8723ds
PKG_RELEASE=1

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

PKG_SOURCE_URL:=https://github.com/jerbe/driver_rtl8723ds.git
PKG_MIRROR_HASH:=bcd3c862d6e6746d61d381981ea1d75346dedd459199415b0ffe37ee4a1d36be
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-04-02
PKG_SOURCE_VERSION:=7093153b0ee887b151f5e8ab5353e05528a4d78d

PKG_MAINTAINER:=Larry Finger <Larry.Finger@lwfinger.net>
PKG_BUILD_PARALLEL:=1
#PKG_EXTMOD_SUBDIRS:=rtl8723ds

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8723ds
	SUBMENU:=Wireless Drivers
	TITLE:=Realtek 8723D SDIO or SPI WiFi
	DEPENDS:=+kmod-cfg80211 +@IPV6 +@USES_REALTEK
	FILES:=\
	$(PKG_BUILD_DIR)/rtl8723ds.ko
	AUTOLOAD:=$(call AutoProbe,rtl8723ds)
	PROVIDES:=kmod-rtl8723ds
endef


NOSTDINC_FLAGS := \
	$(KERNEL_NOSTDINC_FLAGS) \
	-I$(PKG_BUILD_DIR) \
	-I$(PKG_BUILD_DIR)/include \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-include backport/autoconf.h \
	-include backport/backport.h \


NOSTDINC_FLAGS+= \
	-DRTW_SINGLE_WIPHY \
	-DRTW_USE_CFG80211_STA_EVENT \
	-DCONFIG_IOCTL_CFG80211 \
	-DBUILD_OPENWRT

ifeq ($(CONFIG_BIG_ENDIAN),y)
NOSTDINC_FLAGS+= -DCONFIG_BIG_ENDIAN
else
NOSTDINC_FLAGS+= -DCONFIG_LITTLE_ENDIAN
endif

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) \
		M="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		CONFIG_RTL8723DS=m \
		USER_MODULE_NAME=rtl8723ds \
		modules
endef

# 编译前操作
LOCAL_SOURCE_PATH:= /home/jerbe/Work/github.com/jerbe/driver_rtl8723ds
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(LOCAL_SOURCE_PATH)/* $(PKG_BUILD_DIR)/
endef


$(eval $(call KernelPackage,rtl8723ds))