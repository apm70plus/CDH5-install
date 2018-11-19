#!/bin/bash

# 拷贝脚本和文件
for agent in `cat list_agents`
do 
  echo "#### ${agent} 开始安装...   ####"
  ssh root@${agent} "mkdir ~/soft"
  ssh root@${agent} "mkdir ~/scripts"
  scp ~/soft/jdk-8u73-linux-x64.rpm root@${agent}:~/soft/
  scp ~/scripts/00-common-config.sh ~/scripts/02-install-jdk.sh root@${agent}:~/scripts/
  ssh root@${agent} "~/scripts/02-install-jdk.sh"
  ssh root@${agent} "~/scripts/00-common-config.sh"
  echo "#### ${agent} 安装完成，重启服务器。   ####"
done

