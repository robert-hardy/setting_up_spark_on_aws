#!/bin/bash

set -e -x
apt-get --assume-yes update
apt-get --assume-yes install openjdk-8-jdk
apt-get --assume-yes install scala
wget -q http://apache.mirror.anlx.net/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz -P ~/
tar zxvf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local
ln -s /usr/local/spark-2.2.0-bin-hadoop2.7/ /usr/local/spark
cat << 'EOF' > ~/.profile
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$SPARK_HOME/bin
EOF
. ~/.profile
chown -R ubuntu $SPARK_HOME
cat << EOF > /usr/local/spark/conf/spark-env.sh
export JAVA_HOME="$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')"
export SPARK_PUBLIC_DNS="`curl -s http://169.254.169.254/latest/meta-data/public-hostname`"
export SPARK_WORKER_CORES=6
EOF
