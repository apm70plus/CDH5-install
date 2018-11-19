#!/bin/bash

# 06 安装CDH本地源
echo "#### 06、开始安装CDH5本地源... ####"
mkdir -p /opt/cloudera/parcel-repo/
cp ~/soft/CDH-5.15.1-1.cdh5.15.1.p0.4-el7.parcel /opt/cloudera/parcel-repo/
cp ~/soft/CDH-5.15.1-1.cdh5.15.1.p0.4-el7.parcel.sha /opt/cloudera/parcel-repo/ 
cp ~/soft/manifest.json /opt/cloudera/parcel-repo/
echo "#### 06、CDH5本地源安装完成。 ####"



