#!/bin/bash
# 03 安装cloudera-manager 本地源（http://localhost/cm/5.15.1/）
echo "#### 03、开始安装cloudera-manager本地源... ####"
yum install -y httpd
tar zxvf ~/soft/cm5.15.1-centos7.tar.gz -C /var/www/html/
rm -rf /var/run/yum.pid
service httpd restart
echo "#### 03、cloudera-manager本地源安装完成。 ####"

