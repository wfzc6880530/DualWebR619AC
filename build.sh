#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"
command -v go >/dev/null 2>&1 || { echo "ERROR: Go is required to build the DualWeb API." >&2; exit 1; }
test -s src/main.go
test -d overlay
mkdir -p overlay/usr/sbin
echo "========== Build DualWeb API for R619AC (ARMv7) =========="
CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -trimpath -ldflags='-s -w' -o overlay/usr/sbin/dualweb-api src/main.go
chmod 0755 overlay/usr/sbin/dualweb-api
chmod 0755 overlay/etc/uci-defaults/99-dualweb
chmod 0755 overlay/etc/init.d/dualweb-api
chmod 0755 overlay/etc/init.d/dualweb-firstboot
chmod 0755 overlay/usr/sbin/dualweb-firstboot-packages
file overlay/usr/sbin/dualweb-api
echo "DualWeb ARMv7 API build complete."
