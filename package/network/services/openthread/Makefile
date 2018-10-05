#
# Copyright (C) 2010-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openthread

PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
#PKG_SOURCE_URL:=https://github.com/bukepo/openthread.git
PKG_SOURCE_URL:=file:///home/me/Code/openthread
PKG_SOURCE_VERSION:=ow

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)
PKG_MAINTAINER:=Yakun Xu <xyk@google.com>

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_LICENSE:=BSD-3-Clause
#PKG_CPE_ID:=cpe:/a:openthread:openthread

include $(INCLUDE_DIR)/package.mk

define Package/openthread
  TITLE:=Open-source implementation of the Thread networking protocol
  SECTION:=net
  CATEGORY:=Network
  URL:=http://github.com/openthread/openthread
  SUBMENU:=VPN
  MENU:=1
  DEPENDS:= +kmod-tun +libstdcpp
  PROVIDES:=openthread
endef

CONFIGURE_VARS += \
	IFCONFIG=/sbin/ifconfig \
	ROUTE=/sbin/route \
	IPROUTE=/sbin/ip \
	NETSTAT=/sbin/netstat

TARGET_CFLAGS += -ffunction-sections -fdata-sections
TARGET_CXXFLAGS += -fno-exceptions -fno-rtti
TARGET_LDFLAGS += -Wl,--gc-sections

define Build/Configure
	$(call Build/Configure/Default,     \
		--enable-application-coap         \
		--enable-application-coap-secure  \
		--enable-border-agent             \
		--enable-border-router            \
		--enable-cert-log                 \
		--enable-child-supervision        \
		--enable-cli                      \
		--enable-commissioner             \
		--enable-dhcp6-client             \
		--enable-dhcp6-server             \
		--enable-diag                     \
		--enable-dns-client               \
		--enable-ftd                      \
		--enable-jam-detection            \
		--enable-joiner                   \
		--enable-ncp                      \
		--enable-legacy                   \
		--enable-mac-filter               \
		--enable-posix-app                \
		--enable-service                  \
		--enable-udp-proxy                \
		--with-ncp-bus=uart               \
		)
endef

define Build/Prepare
	$(Build/Prepare/Default)
	(cd $(PKG_BUILD_DIR) && ./bootstrap)
endef

define Package/openthread/conffiles
  /etc/config/openthread
endef

define Package/openthread/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/etc/init.d \
		$(1)/etc/config

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/ot-cli \
		$(1)/usr/bin/

	$(INSTALL_BIN) \
		files/openthread.init \
		$(1)/etc/init.d/openthread

	$(INSTALL_CONF) files/openthread.config \
		$(1)/etc/config/openthread
endef

$(eval $(call BuildPackage,openthread))
