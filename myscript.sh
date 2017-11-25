hosts=(master slave)

for host in "${hosts[@]}"
do
	echo Working on $host
	echo =================

	echo Installing Java and Scala
	ssh ubuntu@$host sudo apt-get update
	ssh ubuntu@$host sudo apt-get --assume-yes install openjdk-8-jdk
	ssh ubuntu@$host sudo apt-get --assume-yes install scala

	echo Checking $host for the Spark tarball
	ssh ubuntu@$host test -e spark-2.2.0-bin-hadoop2.7.tgz
	EXIT_CODE=$?
	if [ $EXIT_CODE -eq 0 ]; then
		echo The Spark tarball is there.
	else
		echo Downloading the Spark tarball
		ssh ubuntu@$host wget http://apache.mirror.anlx.net/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
	fi
	echo Checking $host for the Spark home directory
	ssh ubuntu@$host test -e /usr/local/spark
	EXIT_CODE=$?
	if [ $EXIT_CODE -eq 0 ]; then
		echo The Spark home directory is already set up.
	else
		echo Unpacking the tarball, setting up the Spark home dir.
		ssh ubuntu@$host tar zxvf --overwrite spark-2.2.0-bin-hadoop2.7.tgz
		ssh ubuntu@$host sudo mkdir -p /usr/local/spark
		ssh ubuntu@$host sudo mv -v spark-2.2.0-bin-hadoop2.7/* /usr/local/spark
	fi
	ssh ubuntu@$host sudo chown -R ubuntu /usr/local/spark

	echo Writing env vars into the .profile file
	ssh ubuntu@$host < write_to_dot_profile.sh

	echo Writing env vars into the spark-env file
	ssh ubuntu@$host < write_spark_env.sh

	echo Writing into etc/hosts
	ssh ubuntu@$host sudo cat >> /etc/hosts < etc_hosts
done
