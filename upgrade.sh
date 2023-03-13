#
#!/bin/bash
####################################################################
#   鸣谢：
#          小迪同学 & walkxcode & iamsweet & dhruvinsh
# 
####################################################################
# unraid icons
svn co https://github.com/xushier/HD-Icons/trunk/border-radius icons1
# circle
svn co https://github.com/xushier/HD-Icons/trunk/circle icons2
# png
svn co https://github.com/walkxcode/dashboard-icons/trunk/png icons3
#svg
svn co https://github.com/walkxcode/dashboard-icons/trunk/svg icons4
# 标题pic
svn co https://github.com/iamsweet/unraid_docker_icon/trunk/emby头图  title1
#动图
svn co https://github.com/dhruvinsh/unraid-icons/trunk/Orange-Collection gif1

# clean
rm -rf ./*/.svn*
rm -rf ./*/.git*


#end
exit 0
