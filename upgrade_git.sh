#!/bin/bash
####################################################################
#   鸣谢：
#          小迪同学 & walkxcode & iamsweet & dhruvinsh
# 
#   更新说明：由于GitHub停止SVN支持，改用Git sparse-checkout方式
####################################################################

set -e  # 遇到错误时退出

# 保存当前工作目录
WORK_DIR=$(pwd)

# 创建临时目录
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "开始下载图标资源..."

# 配置Git以避免在CI环境中的警告
git config --global advice.detachedHead false
git config --global init.defaultBranch main

# unraid icons - border-radius
echo "正在下载 border-radius 图标..."
git clone --filter=blob:none --sparse https://github.com/xushier/HD-Icons.git HD-Icons-temp1
cd HD-Icons-temp1
git sparse-checkout set border-radius
cd ..
mv HD-Icons-temp1/border-radius "$WORK_DIR/icons1"
rm -rf HD-Icons-temp1

# circle
echo "正在下载 circle 图标..."
git clone --filter=blob:none --sparse https://github.com/xushier/HD-Icons.git HD-Icons-temp2
cd HD-Icons-temp2
git sparse-checkout set circle
cd ..
mv HD-Icons-temp2/circle "$WORK_DIR/icons2"
rm -rf HD-Icons-temp2

# png
echo "正在下载 PNG 图标..."
git clone --filter=blob:none --sparse https://github.com/walkxcode/dashboard-icons.git dashboard-icons-temp1
cd dashboard-icons-temp1
git sparse-checkout set png
cd ..
mv dashboard-icons-temp1/png "$WORK_DIR/icons3"
rm -rf dashboard-icons-temp1

# svg
echo "正在下载 SVG 图标..."
git clone --filter=blob:none --sparse https://github.com/walkxcode/dashboard-icons.git dashboard-icons-temp2
cd dashboard-icons-temp2
git sparse-checkout set svg
cd ..
mv dashboard-icons-temp2/svg "$WORK_DIR/icons4"
rm -rf dashboard-icons-temp2

# 标题pic
echo "正在下载标题图片..."
git clone --filter=blob:none --sparse https://github.com/iamsweet/unraid_docker_icon.git unraid-docker-temp
cd unraid-docker-temp
git sparse-checkout set emby头图
cd ..
mv "unraid-docker-temp/emby头图" "$WORK_DIR/title1"
rm -rf unraid-docker-temp

# 动图
echo "正在下载动图..."
git clone --filter=blob:none --sparse https://github.com/dhruvinsh/unraid-icons.git unraid-icons-temp
cd unraid-icons-temp
git sparse-checkout set Orange-Collection
cd ..
mv unraid-icons-temp/Orange-Collection "$WORK_DIR/gif1"
rm -rf unraid-icons-temp

# 返回原目录并清理
cd "$WORK_DIR"
rm -rf "$TEMP_DIR"

# clean - 清理可能存在的版本控制文件
echo "清理版本控制文件..."
find . -name ".git*" -type d -exec rm -rf {} + 2>/dev/null || true
find . -name ".svn*" -type d -exec rm -rf {} + 2>/dev/null || true

echo "图标下载完成！"

#end
exit 0