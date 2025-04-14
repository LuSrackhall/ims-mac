#!/bin/bash

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

INSTALL_PATH="/usr/local/bin"
BINARIES=("refresh-input-focus" "im-select" "ims-mac")

# 检查是否有root权限
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}请使用 sudo 运行此脚本${NC}"
    exit 1
fi

# 安装
echo -e "${GREEN}正在安装二进制文件到 ${INSTALL_PATH}...${NC}"
for binary in "${BINARIES[@]}"; do
    if [ -f "$binary" ]; then
        install -m 755 "$binary" "${INSTALL_PATH}/${binary}"
        echo "✓ 已安装: $binary"
    else
        echo -e "${RED}错误: 找不到 $binary${NC}"
        exit 1
    fi
done
echo -e "${GREEN}安装完成!${NC}"
