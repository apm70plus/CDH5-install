#!/bin/bash

# 如果你想修改主机名，参考下面的方式手动执行 (https://www.linuxidc.com/Linux/2014-11/109238.htm)
# hostnamectl set-hostname $hostname

# 安装之前，请先配置好本地的服务器域名解析 /etc/hosts
# 要安装的 Agent 服务器列表，空格分隔（已经安装过的服务器，不要出现在列表里）
export AGENT_LIST="node2 node3"

