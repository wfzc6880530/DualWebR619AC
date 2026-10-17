# DualWeb R619AC

为 P&W R619AC 128M NAND（竞斗云）构建集成 DualWeb 管理首页的 ImmortalWrt 固件。

## 构建策略

- 固件基线：ImmortalWrt `openwrt-25.12` 分支（Linux 6.12 系列，使用 APK 包管理器以匹配 DualWeb 的安装流程）。
- 设备：`ipq40xx/generic` / `p2w_r619ac-128m`。
- DualWeb：参考 `wfzc6880530/dualweb` 的 `test/openbox-artifacts` 分支，将后端交叉编译为 ARMv7 并打包到固件。
- 构建通过 GitHub Actions 执行，固件作为 Actions Artifact 保存。

## 如何构建

1. 打开仓库的 **Actions**。
2. 选择 **Build DualWeb R619AC 128M**。
3. 点击 **Run workflow**。
4. 成功后进入运行详情的 **Artifacts** 下载固件与校验文件。

## 重要说明

- 首版以正确识别设备、完成构建并集成 DualWeb 为优先，不会绕过设备 profile 检查。
- DualWeb 首页默认使用 HTTP 80 端口，LuCI 管理界面调整到 HTTP 8080 端口；首页初始密码为 `root`，首次登录后请立即修改。
- 首次启动后，DualWeb 的后台安装服务会尝试通过网络安装适配 ImmortalWrt 25.12 的 Nikki/Mihomo；请确保路由器能访问软件源。该安装过程不影响固件构建。
- 仅适用于已确认是 P&W R619AC 128M NAND 的设备。不要刷入 64M 版本或其他设备的固件。
- 首次刷机前备份配置并确认当前固件的升级/救援方式。
- DualWeb 上游的 Open-Box 专有运行时不包含在本项目中；本项目仅集成公开的 DualWeb 页面与 API。
