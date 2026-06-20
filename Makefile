# Description: LuxeOs Theme for LuCI
# License: GPL-3.0

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-theme-luxe
PKG_VERSION:=2.6.1_beta1
PKG_RELEASE:=210626
PKG_LICENSE:=GPL-3.0
PKG_MAINTAINER:=xidz_x
PKGARCH:=all

LUCI_TITLE:=LuxeOs Theme
LUCI_DEPENDS:=+luci-base +jsonfilter
LUCI_PKGARCH:=all

CONFIG_LUCI_CSSTIDY:=

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signatur
