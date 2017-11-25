hosts=(master slave)

for host in "${hosts[@]}"
do
	ssh ubuntu@$host sudo apt-get update
	ssh ubuntu@$host sudo apt-get --assume-yes install openjdk-8-jdk
	ssh ubuntu@$host sudo apt-get --assume-yes install scala
done
