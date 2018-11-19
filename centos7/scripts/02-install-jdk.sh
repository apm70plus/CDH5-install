#!/bin/bash
# 01 安装JDK
echo "#### 02、开始安装JDK... ####"
rpm -ivh ~/soft/jdk-8u73-linux-x64.rpm
# 配置环境变量
sed -i '/export PATH/i\export JAVA_HOME=/usr/java/jdk1.8.0_73\nPATH=$PATH:$JAVA_HOME' ~/.bash_profile

source ~/.bash_profile
echo "#### 02、JDK安装完成。 ####"

