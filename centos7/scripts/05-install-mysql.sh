#!/bin/bash
# 05 MySQL安装
echo "#### 05、开始安装、配置cloudera-manager数据库... ####"
yum install mariadb-server mysql-connector-java -y

# 修改配置文件，以支持utf-8
sed -i "/^\[mysql\]/a\default-character-set=utf8" /etc/my.cnf.d/mysql-clients.cnf
sed -i "/^\[mysqld\]/a\character_set_server=utf8\ninit_connect='SET NAMES utf8'" /etc/my.cnf.d/server.cnf

systemctl start mariadb
systemctl enable mariadb

echo "\
create database hive DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on hive.* to 'hive'@'%' identified by 'hive_123456'; \
create database amon DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on amon.* to 'amon'@'%' identified by 'amon_123456'; \
create database oozie DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on oozie.* to 'oozie'@'%' identified by 'oozie_123456'; \
create database hue DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on hue.* to 'hue'@'%' identified by 'hue_123456'; \
create database monitor DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on monitor.* to 'monitor'@'%' identified by 'monitor_123456'; \
create database rman DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on rman.* to 'rman'@'%' identified by 'rman_123456'; \
create database metastore DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on metastore.* to 'metastore'@'%' identified by 'metastore_123456'; \
create database sentry DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on sentry.* to 'sentry'@'%' identified by 'sentry_123456'; \
create database nav DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on nav.* to 'nav'@'%' identified by 'nav_123456'; \
create database navms DEFAULT CHARSET utf8 COLLATE utf8_general_ci; \
grant all privileges on navms.* to 'navms'@'%' identified by 'navms_123456'; \
flush privileges; \
" | mysql -uroot

# 数据通用安全配置
echo "Mariadb 通用的安全设置，不执行该设置，无法远程登陆，建议输入 enter n y y y y"
mysql_secure_installation

# 导入scm数据
/usr/share/cmf/schema/scm_prepare_database.sh mysql -uroot scm scm scm_123456

echo "#### 05、安装、配置cloudera-manager数据库完成 ####"

