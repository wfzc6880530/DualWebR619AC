# DualWeb R619AC 128M

为 P&W R619AC 128M NAND（竞斗云）构建集成 DualWeb 管理首页的 ImmortalWrt 固件。

## 当前构建分支

- 固件基线：ImmortalWrt `openwrt-24.10` 分支，Linux 6.6 / opkg。
- 设备目标：`ipq40xx/generic`。
- 设备配置：`p2w_r619ac-128m`。
- DualWeb：从 `wfzc6880530/dualweb` 的 `test/openbox-artifacts` 分支获取公开 UI/API，后端交叉编译为 ARMv7。
- 构建：GitHub Actions；成功后在运行详情的 Artifacts 下载固件。

## 编译方式

1. 打开仓库 Actions。
2. 选择 **Build DualWeb R619AC 128M (ImmortalWrt 24.10)**。
3. 点击 **Run workflow**，选择 `immortalwrt-24.10` 分支。
4. 成功后下载 `DualWeb-ImmortalWrt-24.10-R619AC-128M` Artifact。

## 设计原则

- 在 `.config` 中显式选择 R619AC 128M 设备，并在编译前验证设备选择确实保留。
- 编译结束后同时核验 factory.ubi 与 sysupgrade.bin，缺失时输出设备 profile 诊断信息。
- 首轮优先验证设备镜像生成和 DualWeb 基础集成，再单独验证 Nikki/Mihomo 等可选组件。
- ImmortalWrt 24.10 使用 opkg，不是 ImmortalWrt 25.12 的 apk。旧的首次启动插件安装脚本可能依赖 apk；在确认 Nikki 安装器兼容 opkg 前，不应把自动安装成功视为已验证功能。

## 注意事项

- 仅适用于确认是 P&W R619AC 128M NAND 的设备；不要刷入 64M 版本或其他设备固件。
- 首次刷机前备份配置，并确认当前固件的升级/救援方式。
- DualWeb 首页默认使用 HTTP 80 端口，LuCI 管理界面调整到 HTTP 8080 端口；首页初始密码为 `root`，首次登录后请立即修改。
- 上游 DualWeb 的 Open-Box 专有运行时不包含在本项目中；本项目只集成公开的页面与 API。
