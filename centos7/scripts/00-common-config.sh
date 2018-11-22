#!/bin/bash

echo "#### 00、开始服务器基础配置... ####"
# 关闭防火墙
systemctl mask firewalld.service

# 关闭Selinux
setenforce 0
sed -i '/SELINUX=enforcing/d' /etc/selinux/config
sed -i '/SELINUX=disabled/d' /etc/selinux/config
echo "SELINUX=disabled" >> /etc/selinux/config

# 服务器设置文件打开数量及最大进程数
cp /etc/security/limits.conf /etc/security/limits.conf.bak
echo "* soft nproc 32000" >>/etc/security/limits.conf
echo "* hard nproc 32000" >>/etc/security/limits.conf
echo "* soft nofile 65535" >>/etc/security/limits.conf
echo "* hard nofile 65535" >>/etc/security/limits.conf

# 服务器内核参数配置
sed -i "/swappiness/d" /etc/rc.local 
echo "echo 10 > /proc/sys/vm/swappiness" >> /etc/rc.local 
sed -i "/zone_reclaim_mode/d" /etc/rc.local 
echo "echo 0 > /proc/sys/vm/zone_reclaim_mode" >> /etc/rc.local  
sed -i "/min_free_kbytes/d" /etc/rc.local 
echo "echo 1048576 > /proc/sys/vm/min_free_kbytes"  >> /etc/rc.local  
sed -i "/transparent_hugepage/d" /etc/rc.local
echo "echo never > /sys/kernel/mm/transparent_hugepage/defrag" >> /etc/rc.local  
echo "echo never > /sys/kernel/mm/transparent_hugepage/enabled" >> /etc/rc.local  
echo 10 > /proc/sys/vm/swappiness  
#(echo 'vm.swappiness=10'>> /etc/sysctl.conf)
echo 0 > /proc/sys/vm/zone_reclaim_mode  
echo 1048576 > /proc/sys/vm/min_free_kbytes  
echo never > /sys/kernel/mm/transparent_hugepage/defrag  
echo never > /sys/kernel/mm/transparent_hugepage/enabled

# centos 7.2版本存在tuned服务，该服务会修改swappiness，transparent_hugepage参数值，导致上面的部分配置失效
# 可以通过 grep -r swappiness /etc  和 grep -r swappiness /usr/lib/tuned 查看相关配置
# 链接地址 https://www.centos.org/forums/viewtopic.php?t=55678

# 配置集群时间同步服务
# TODO

echo "#### 00、服务器基础配置完成。 ####"


