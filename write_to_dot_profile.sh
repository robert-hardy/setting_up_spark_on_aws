cat << EOF > ~/.profile
export JAVA_HOME=$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')
export SPARK_HOME=/usr/local/spark
export PATH=\$PATH:\$SPARK_HOME/bin
EOF
