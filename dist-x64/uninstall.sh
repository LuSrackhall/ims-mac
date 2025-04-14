#!/bin/bash

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

INSTALL_PATH="/usr/local/bin"
BINARIES=("refresh-input-focus" "im-select__ims-mac" "ims-mac")

# 检查是否有root权限
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}请使用 sudo 运行此脚本${NC}"
    exit 1
fi

# 卸载
echo -e "${GREEN}正在从 ${INSTALL_PATH} 移除二进制文件...${NC}"
for binary in "${BINARIES[@]}"; do
    if [ -f "${INSTALL_PATH}/${binary}" ]; then
        rm -f "${INSTALL_PATH}/${binary}"
        echo "✓ 已移除: $binary"
    fi
done
echo -e "${GREEN}卸载完成!${NC}"
