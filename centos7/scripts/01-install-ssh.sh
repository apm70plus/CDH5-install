#!/bin/bash

# 构建SSH无密码访问
echo "#### 01、开始配置SSH无密码访问... ####"
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

for agent in `cat ~/scripts/list_agents`
do 
  echo "开始拷贝SSH公钥到${agent}服务器"
  ssh-copy-id -i ~/.ssh/id_rsa.pub root@${agent}
done
echo "#### 01、SSH无密码访问配置完成。 ####"


