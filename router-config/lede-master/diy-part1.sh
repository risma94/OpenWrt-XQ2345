#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Uncomment a feed source
# sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default
# sed -i 's/\"#src-git\"/\"src-git\"/g' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}

sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

sed -i 's/root::0:0:99999:7:::/root:$1$8sK1sK5D$F5xbVvcQAQfmteDdHQXMD0:19190:0:99999:7:::/g' package/base-files/files/etc/shadow

sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$8sK1sK5D$F5xbVvcQAQfmteDdHQXMD0:19190:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings

sed -i '5i src-git kenzo https://github.com/kenzok8/openwrt-packages\nsrc-git small https://github.com/kenzok8/small\nsrc-git amlogic https://github.com/ophub/luci-app-amlogic\nsrc-git tailscale https://github.com/LeanFly/luci-app-tailscale' feeds.conf.default
