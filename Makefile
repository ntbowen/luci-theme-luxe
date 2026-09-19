# LuCI Luxe Theme
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

# Pin LUCI_NAME: luci.mk defaults it to the checkout's directory name, which
# would silently derail its per-package hooks when the tree is linked into a
# buildroot under a different name.
LUCI_NAME:=luci-theme-luxe

LUCI_TITLE:=LuCI Theme For OpenWrt - LuxeOs
LUCI_DEPENDS:=+luci-base
LUCI_PKGARCH:=all
LUCI_URL:=https://github.com/de-quenx/luci-theme-luxe
LUCI_MAINTAINER:=xidz_x

# 'id' is not in luci.mk's LUCI_LANG table; declaring it here is what makes
# po/id/ produce a luci-i18n-luxe-id package at all.
LUCI_LANG.id:=Bahasa Indonesia (Indonesian)

PKG_VERSION:=2.6.0
PKG_RELEASE:=07072026
PKG_LICENSE:=Apache-2.0

# Defining a postinst replaces luci.mk's default, so the cache flush and rpcd
# reload it performs are repeated here after the uci-defaults bootstrap.
define Package/luci-theme-luxe/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -f /etc/uci-defaults/33_luci-theme-luxe ]; then
		. /etc/uci-defaults/33_luci-theme-luxe
		rm -f /etc/uci-defaults/33_luci-theme-luxe
	fi
	rm -rf /tmp/luci-indexcache* /tmp/luci-modulecache/
	/etc/init.d/rpcd reload 2>/dev/null
fi
exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
