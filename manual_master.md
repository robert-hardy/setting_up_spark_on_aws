1. Add `xxx.xxx.xxx.xxx master` in Macbook `/etc/hosts`.
2. `ssh ubuntu@master`.
3. Install Java:

        sudo apt-get --assume-yes update
        sudo apt-get --assume-yes install openjdk-8-jdk
4. Install Scala:

        sudo apt-get --assume-yes install scala
5. Download Spark and unpack:

        wget http://apache.mirror.anlx.net/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz -P ~/
        sudo tar zxvf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local
6. Add these to the `.profile`:

        export JAVA_HOME=$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')
        export SPARK_HOME=/usr/local/spark-2.2.0-bin-hadoop2.7/
        export PATH=\$PATH:\$SPARK_HOME/bin
