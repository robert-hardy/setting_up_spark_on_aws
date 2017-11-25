hosts=(master slave)

for host in "${hosts[@]}"
do
	ssh ubuntu@$host sudo apt-get update
	ssh ubuntu@$host sudo apt-get --assume-yes install openjdk-8-jdk
	ssh ubuntu@$host sudo apt-get --assume-yes install scala
	ssh ubuntu@$host wget http://apache.mirror.anlx.net/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
	ssh ubuntu@$host sudo tar zxvf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local
done
