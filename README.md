# Netcore N30 Pro custom ImmortalWrt

GitHub Actions build project for the Netcore N30 Pro (MT7981B + MT7976CN).

## Build profile

- Base source: `padavanonly/immortalwrt-mt798x-6.6`
- Branch: `openwrt-24.10-6.6`
- Wi-Fi: MediaTek proprietary `mt_wifi` driver
- Device adaptation: pinned `liuyi-htu/Netcore-N30-Pro-patch-for-OpenWrt`
- Default LAN address: `192.168.6.1`
- Initial root password: empty; set one immediately after first login

## Included features

- iStore
- OpenClash with embedded arm64 Meta core
- MediaTek TurboACC, HNAT, WED and WARP
- ttyd web terminal
- Samba4 and USB storage support (ext4, exFAT, NTFS3)
- Per-device bandwidth statistics (`nlbwmon`)
- UPnP / NAT-PMP
- LuCI file manager
- Tailscale and `kmod-tun`
- SFTP server and maintenance tools

## Firmware files

The workflow publishes N30 Pro `factory.bin` and `sysupgrade.bin` images when the build succeeds. It does not build or publish BL2/FIP bootloader images.

This project is an untested custom build. Verify the exact hardware model, keep the original firmware and a known-good recovery method, and do not flash bootloader partitions with a system image.
