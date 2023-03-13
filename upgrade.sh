#
#!/bin/bash



# unraid icons
svn co https://github.com/xushier/HD-Icons/trunk/border-radius icons
# circle
svn co https://github.com/xushier/HD-Icons/trunk/circle icons
# png
svn co https://github.com/walkxcode/dashboard-icons/trunk/png icons
#svg
svn co https://github.com/walkxcode/dashboard-icons/trunk/svg icons
# 标题pic
svn co https://github.com/iamsweet/unraid_docker_icon/trunk/emby头图  title
#动图
svn co https://github.com/dhruvinsh/unraid-icons/trunk/Orange-Collection gif

# clean
rm -rf ./*/.svn*
rm -rf ./*/.git*


#end
exit 0
