#!/bin/bash

# 定义目标目录
TARGET_DIR="./sites/"

# 确保目标目录存在
mkdir -p "$TARGET_DIR"

# 定义要下载的文件列表
FILES=(
    "https://raw.githubusercontent.com/nascloud/mosdns_rules/refs/heads/main/mosdns/china-list.txt"
    "https://raw.githubusercontent.com/nascloud/mosdns_rules/refs/heads/main/mosdns/telegram.txt"
    "https://raw.githubusercontent.com/nascloud/mosdns_rules/refs/heads/main/mosdns/proxy-list.txt"
    "https://raw.githubusercontent.com/nascloud/mosdns_rules/refs/heads/main/mosdns/tesla.txt"
)

# 遍历并下载每个文件
for url in "${FILES[@]}"; do
    filename=$(basename "$url")
    echo "正在下载 $filename..."
    if curl -L "$url" -o "$TARGET_DIR/$filename"; then
        echo "成功下载了 $filename"
    else
        echo "下载 $filename 失败" >&2
    fi
done

echo "所有文件已下载到 $TARGET_DIR"