#
#!/bin/bash

function svn_co() {
  rm -rf $(basename $1 .git)
  svn co $1 $(basename $1 .git) || true
  rm -rf $(basename $1 .git)/.svn* $(basename $1 .git)/.git*
}


# unraid icons
svn_co https://github.com/xushier/HD-Icons/trunk/border-radius
# circle
svn_co https://github.com/xushier/HD-Icons/trunk/circle
# png
svn_co https://github.com/walkxcode/dashboard-icons/trunk/png
#svg
svn_co https://github.com/walkxcode/dashboard-icons/trunk/svg


# clean
rm -rf ./*/.svn*
rm -rf ./*/.git*


#end
exit 0
