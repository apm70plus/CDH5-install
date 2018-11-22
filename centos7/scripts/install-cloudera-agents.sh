#!/bin/bash

# 拷贝脚本和文件
source ~/scripts/config.sh
agents=("$AGENT_LIST")
for agent in ${agents[@]}
do 
  echo "#### ${agent} 开始安装...   ####"
  ssh root@${agent} "mkdir ~/soft"
  ssh root@${agent} "mkdir ~/scripts"
  scp ~/soft/jdk-8u73-linux-x64.rpm root@${agent}:~/soft/
  scp ~/scripts/00-install-common.sh ~/scripts/02-install-jdk.sh root@${agent}:~/scripts/
  ssh root@${agent} "~/scripts/00-install-common.sh"
  ssh root@${agent} "~/scripts/02-install-jdk.sh"
  ssh root@${agent} "reboot"
  echo "#### ${agent} 安装完成，重启服务器。   ####"
done

