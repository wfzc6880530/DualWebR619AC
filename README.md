# DualWeb R619AC 128M — ImmortalWrt 24.10

本仓库以 [DualWeb](https://github.com/wfzc6880530/DualWeb) 的项目文件为基准，保留相同的网页、API 和 overlay 结构，针对竞斗云 / P&W R619AC 128M NAND 单独构建固件。

## 固件基线

- ImmortalWrt：`openwrt-24.10`
- Linux kernel：6.6（由该分支目标配置决定）
- Target：`ipq40xx/generic`
- Device：`p2w_r619ac-128m`
- DualWeb API：交叉编译为 ARMv7
- 网页/API：从本仓库的 `overlay/` 和 `src/` 构建，不再在工作流中临时克隆 DualWeb 拼装。
- 首次启动首页初始密码为 `root`，登录后请立即修改。
- LuCI 管理界面使用 8080 端口；DualWeb 首页使用 80 端口。

## 仓库结构

- `src/main.go`：DualWeb API 源码
- `overlay/`：首页、Nginx、服务脚本和首启配置
- `packages.txt`：项目基础软件包清单
- `config/r619ac.config`：R619AC 128M 构建配置
- `build.sh`：将 DualWeb API 交叉编译为 ARMv7
- `.github/workflows/build.yml`：从 ImmortalWrt 24.10 源码构建整套固件

## Nikki 说明

ImmortalWrt 24.10 使用 opkg，而当前 DualWeb 的 Nikki 首启安装辅助脚本按 apk feeds 编写。因此本构建保留该脚本文件，但暂不启用自动安装，避免生成一个看似成功、实际首启安装失败的固件。Nikki 尚未作为已验证的 24.10 内置组件提供。

## 构建产物

Actions 成功后应同时生成：

- `factory.ubi`：用于符合设备刷写流程的初始安装场景
- `sysupgrade.bin`：用于受支持的系统内升级场景
- 校验和与构建元数据

请先阅读设备对应的刷写说明，再选择镜像；不要将其他设备的固件刷入 R619AC。
