#!/bin/bash

# A work in progress

apt-get update && apt-get upgrade
apt-get install -y software-properties-common
add-apt-repository -y ppa:webupd8team/java
apt-get update

echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

apt-get install -y oracle-java9-installer
apt install -y oracle-java9-set-default

wget http://ftp.wayne.edu/apache/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz
tar -xvzf spark-2.3.0-bin-hadoop2.7.tgz
mv /spark-2.3.0-bin-hadoop2.7 /opt/spark-2.3.0
chown -R ubuntu:ubuntu /opt/spark-2.3.0
echo "export PATH=/opt/spark-2.3.0/bin:$PATH" >> /home/ubuntu/.bashrc && source /home/ubuntu/.bashrc
source /home/ubuntu/.bashrc

wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.tar.gz

mkdir /opt/java
tar -zxf jdk-9.0.4_linux-x64_bin.tar.gz -C /opt/java

apt-get update
apt-get install -y python3-pip python3-dev python-virtualenv
echo "export PYSPARK_PYTHON=python3" >> /etc/environment
echo "export PATH=/opt/spark-2.3.0/bin:$PATH" >> /etc/environment && source /etc/environment

