#!/bin/sh
sed -i '/Skyscrapers-xzx_feeds/d' /etc/opkg/customfeeds.conf
echo "src/gz Skyscrapers-xzx_feeds https://cdn.jsdelivr.net/gh/Skyscrapers-xzx/Openwrt_Packages/AXT1800" >>/etc/opkg/customfeeds.conf
opkg update
action="$1"
case "${action}" in
ssr-plus)
	opkg install luci-i18n-base-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg
	;;
passwall)
	opkg install luci-i18n-base-zh-cn luci-app-passwall luci-i18n-passwall-zh-cn luci-compat luci-lib-ipkg
	;;
openclash)
	wget -qO- https://cdn.jsdelivr.net/gh/Skyscrapers-xzx/Install-Openclash-for-Axt1800/install_clash.sh | sh
	;;
*)
	opkg install luci-i18n-base-zh-cn luci-app-passwall luci-i18n-passwall-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg
	wget -qO- https://cdn.jsdelivr.net/gh/Skyscrapers-xzx/Install-Openclash-for-Axt1800/install_clash.sh | sh
	;;
esac