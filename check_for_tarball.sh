hosts=(master slave)

for host in "${hosts[@]}"
do
	echo Checking $host for the tarball
	ssh ubuntu@$host test -e spark-2.2.0-bin-hadoop2.7.tgz
	FILE_EXISTS=$?
	echo $FILE_EXISTS
	echo Checking $host for the directory
	ssh ubuntu@$host test -e /usr/local/spark
	DIR_EXISTS=$?
	echo $DIR_EXISTS
done
