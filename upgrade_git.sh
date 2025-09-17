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
echo "当前工作目录: $WORK_DIR"

# 清理旧的目录（如果存在）
echo "清理旧目录..."
rm -rf icons1 icons2 icons3 icons4 title1 gif1

# 创建临时目录
TEMP_DIR=$(mktemp -d)
echo "临时目录: $TEMP_DIR"
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
if [ -d "HD-Icons-temp1/border-radius" ]; then
    mv HD-Icons-temp1/border-radius "$WORK_DIR/icons1"
    echo "✓ border-radius 图标下载成功"
else
    echo "✗ border-radius 目录不存在"
fi
rm -rf HD-Icons-temp1

# circle
echo "正在下载 circle 图标..."
git clone --filter=blob:none --sparse https://github.com/xushier/HD-Icons.git HD-Icons-temp2
cd HD-Icons-temp2
git sparse-checkout set circle
cd ..
if [ -d "HD-Icons-temp2/circle" ]; then
    mv HD-Icons-temp2/circle "$WORK_DIR/icons2"
    echo "✓ circle 图标下载成功"
else
    echo "✗ circle 目录不存在"
fi
rm -rf HD-Icons-temp2

# png
echo "正在下载 PNG 图标..."
git clone --filter=blob:none --sparse https://github.com/walkxcode/dashboard-icons.git dashboard-icons-temp1
cd dashboard-icons-temp1
git sparse-checkout set png
cd ..
if [ -d "dashboard-icons-temp1/png" ]; then
    mv dashboard-icons-temp1/png "$WORK_DIR/icons3"
    echo "✓ PNG 图标下载成功"
else
    echo "✗ png 目录不存在"
fi
rm -rf dashboard-icons-temp1

# svg
echo "正在下载 SVG 图标..."
git clone --filter=blob:none --sparse https://github.com/walkxcode/dashboard-icons.git dashboard-icons-temp2
cd dashboard-icons-temp2
git sparse-checkout set svg
cd ..
if [ -d "dashboard-icons-temp2/svg" ]; then
    mv dashboard-icons-temp2/svg "$WORK_DIR/icons4"
    echo "✓ SVG 图标下载成功"
else
    echo "✗ svg 目录不存在"
fi
rm -rf dashboard-icons-temp2

# 标题pic
echo "正在下载标题图片..."
git clone --filter=blob:none --sparse https://github.com/iamsweet/unraid_docker_icon.git unraid-docker-temp
cd unraid-docker-temp
git sparse-checkout set emby头图
cd ..
if [ -d "unraid-docker-temp/emby头图" ]; then
    mv "unraid-docker-temp/emby头图" "$WORK_DIR/title1"
    echo "✓ 标题图片下载成功"
else
    echo "✗ emby头图 目录不存在"
fi
rm -rf unraid-docker-temp

# 动图
echo "正在下载动图..."
git clone --filter=blob:none --sparse https://github.com/dhruvinsh/unraid-icons.git unraid-icons-temp
cd unraid-icons-temp
git sparse-checkout set Orange-Collection
cd ..
if [ -d "unraid-icons-temp/Orange-Collection" ]; then
    mv unraid-icons-temp/Orange-Collection "$WORK_DIR/gif1"
    echo "✓ 动图下载成功"
else
    echo "✗ Orange-Collection 目录不存在"
fi
rm -rf unraid-icons-temp

# 返回原目录并清理
cd "$WORK_DIR"
rm -rf "$TEMP_DIR"

# clean - 清理可能存在的版本控制文件
echo "清理版本控制文件..."
find . -name ".git*" -type d -exec rm -rf {} + 2>/dev/null || true
find . -name ".svn*" -type d -exec rm -rf {} + 2>/dev/null || true

# 验证最终结果
echo "验证下载结果..."
for dir in icons1 icons2 icons3 icons4 title1 gif1; do
    if [ -d "$dir" ]; then
        count=$(find "$dir" -type f | wc -l)
        echo "✓ $dir: $count 个文件"
    else
        echo "✗ $dir: 目录不存在"
    fi
done

echo "图标下载完成！"

#end
exit 0