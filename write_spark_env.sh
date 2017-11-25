cat << EOF | sudo tee -a /usr/local/spark/conf/spark-env.sh
export JAVA_HOME=$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')
export SPARK_PUBLIC_DNS="`curl -s http://169.254.169.254/latest/meta-data/public-hostname`"
export SPARK_WORKER_CORES=6
EOF
