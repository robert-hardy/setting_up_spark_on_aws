echo Writing hosts into this Macbook '/etc/hosts'
cat <(echo) etc_hosts | sudo tee -a /etc/hosts

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
		ssh ubuntu@$host tar zxvf spark-2.2.0-bin-hadoop2.7.tgz
		ssh ubuntu@$host sudo mkdir -p /usr/local/spark
		ssh ubuntu@$host sudo mv -v spark-2.2.0-bin-hadoop2.7/* /usr/local/spark
	fi
	ssh ubuntu@$host sudo chown -R ubuntu /usr/local/spark

	echo Writing env vars into the .profile file
	ssh ubuntu@$host < write_to_dot_profile.sh

	echo Writing env vars into the spark-env file
	ssh ubuntu@$host < write_spark_env.sh

	echo Writing into hosts
	# See https://stackoverflow.com/a/23549826/1243435.
	# The <(echo) bit simply adds a newline before the contents of etc_hosts.
	cat <(echo) etc_hosts | ssh ubuntu@$host "sudo tee -a /etc/hosts"
done

echo Creating keys on master and copying to slave
ssh ubuntu@master 'ssh-keygen -f ~/.ssh/id_rsa -t rsa -P ""'
scp ubuntu@master:/home/ubuntu/.ssh/id_rsa.pub master_key.pub
ssh-copy-id -f -i master_key ubuntu@slave

echo Tell master who the slaves are
ssh ubuntu@master 'echo slave >> /usr/local/spark/conf/slaves'
