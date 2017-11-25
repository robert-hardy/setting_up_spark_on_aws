hosts=(master slave)

for host in "${hosts[@]}"
do
	echo Checking $host for the tarball
	ssh ubuntu@$host test -e spark-2.2.0-bin-hadoop2.7.tgz
	EXIT_CODE=$?
	if [ $EXIT_CODE -eq 0 ]; then
		echo The tarball is there.
	else
		echo The tarball is not there.
	fi
	echo Checking $host for the directory
	ssh ubuntu@$host test -e /usr/local/spark
	EXIT_CODE=$?
	if [ $EXIT_CODE -eq 0 ]; then
		echo The tarball has been unpacked.
	else
		echo The tarball has not been unpacked.
	fi
done
