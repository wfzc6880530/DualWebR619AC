# DualWeb R619AC

为 P&W R619AC 128M NAND（竞斗云）构建集成 DualWeb 管理首页的 ImmortalWrt 固件。

## 构建策略

- 固件基线：ImmortalWrt `openwrt-24.10` 分支（Linux 6.6 系列）。
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
- 仅适用于已确认是 P&W R619AC 128M NAND 的设备。不要刷入 64M 版本或其他设备的固件。
- 首次刷机前备份配置并确认当前固件的升级/救援方式。
- DualWeb 上游的 Open-Box 专有运行时不包含在本项目中；本项目仅集成公开的 DualWeb 页面与 API。
