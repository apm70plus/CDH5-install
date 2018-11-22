# Cloudera-manager+CDH5.15.1 CentOS7离线安装

## 硬件环境
- 操作系统：CentOS 7.2

## 安装准备工作

1. 下载需要的安装包
- [cm5.15.1-centos7.tar.gz]()
- [CDH-5.15.1-1.cdh5.15.1.p0.4-el7.parcel](https://archive.cloudera.com/cdh5/parcels/5.15.1.4/CDH-5.15.1-1.cdh5.15.1.p0.4-el7.parcel)
- [CDH-5.15.1-1.cdh5.15.1.p0.4-el7.parcel.sha](https://archive.cloudera.com/cdh5/parcels/5.15.1.4/CDH-5.15.1-1.cdh5.15.1.p0.4-el7.parcel.sha1)
- [manifest.json](https://archive.cloudera.com/cdh5/parcels/5.15.1.4/manifest.json)
- [jdk-8u73-linux-x64.rpm](https://mirror.its.sfu.ca/mirror/CentOS-Third-Party/NSG/common/x86_64/jdk-8u73-linux-x64.rpm)

2. 准备centos7服务器  
- 准备两台以上centos服务器
- 管理节点要求内存不低于4G，磁盘空间不低于30G
- 数据节点要求内存不低于2G，磁盘空间不低于30G

## 安装
1. 前提条件
- root用户登录服务器
- 提前在所有服务器配置好本地服务器名解析（/etc/hosts）
- 工作根目录（cd ~/）下，创建 soft 和 scripts 文件夹，将下载的安装包放在soft目录下，scripts文件夹放[安装脚本](https://github.com/apm70plus/CDH5-install/edit/master/centos7/scripts)
- config.sh 配置agent节点列表(不包含管理节点)

2. 安装cloudera-manager-server
```
~/scripts/install-cloudera-server.sh
```
注意：安装过程中有两次人机交互：  
一次是配置SSH免密访问，需要输入目标节点的密码  
一次是安装完数据库，需要设置通用安全配置，建议输入 enter n y y y y 完成数据库安全配置，否则无法远程访问

3. 管理节点重启，确认httpd服务正常启动
```
systemctl restart httpd
```

4. 配置cloudera-manager-agent的系统参数并安装JDK，配置完成服务器会自动重启  
```
~/scripts/install-cloudera-agent.sh
```

5. 登录Cloudera-Manager管理页面，进入图形化界面后按照以下步骤进行agent发现和集群初始化
- 访问地址： master:7180 默认账户（admin:admin）
- 选择 Yes, I accept the End User License Terms and Conditions.，然后一路 Continue
- 在 Specify hosts for your CDH cluster installation. 界面输入机器列表（逗号分隔），并点击  Search：
- 全选机器后，点击 Continue
- 选择Use Parcels (Recommended)
- 在More Options中去掉所有远程Repo配置
- 选择CDH-5.15.1-1.cdh5.15.1.p0.4
- 选择Custom Repository，并且使用局域网httpd，地址为：http://${master}/cm/5.15.1/， ${master}为管理节点地址
- Install Oracle Java SE Development Kit (JDK)不勾选
- Single User Mode不勾选
- Login To All Hosts As:选择root，并录入CentOS的root密码
- 正常情况下会自动进行Cloudera安装包分发，以及agent进程启动，中间出现失败情况，可以重试一般都能解决

6. 进行Hadoop服务部署
这块不在这里进行描述，按照您的需要进行部署
