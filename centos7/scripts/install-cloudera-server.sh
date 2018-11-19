#!/bin/bash

# 安装cloudera-manager服务端

# 01 配置SSH无密码访问
~/scripts/01-install-ssh.sh

# 02 安装JDK
~/scripts/02-install-jdk.sh

# 03 安装cloudera-manager 本地源
~/scripts/03-install-cm-repo.sh

# 04 安装cloudera-manager server
~/scripts/04-install-cm-server.sh

# 05 安装数据库和驱动
~/scripts/05-install-mysql.sh

# 06 安装CDH本地源
~/scripts/06-install-cdh-repo.sh

# 08 重启服务器，安装结束
echo "安装结束，请访问node1:7180 (user:admin pwd:admin)安装大数据CDH集群"
