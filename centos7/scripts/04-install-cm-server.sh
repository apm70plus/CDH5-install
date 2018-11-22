#!/bin/bash

# 04 安装cloudera-manager server 本地源（http://localhost/cm/5.15.1/）
echo "#### 04、开始安装cloudera-manager-server... ####"
yum install -y perl
rpm -ivh /var/www/html/cm/5.15.1/RPMS/x86_64/cloudera-manager-daemons-5.15.1-1.cm5151.p0.3.el7.x86_64.rpm
rpm -ivh /var/www/html/cm/5.15.1/RPMS/x86_64/cloudera-manager-server-5.15.1-1.cm5151.p0.3.el7.x86_64.rpm
echo "#### 04、cloudera-manager-server安装完成。 ####"
