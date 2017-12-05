1. Delete the `master` and `slave` entries in the Macbook `/etc/hosts` and in `~/.ssh/known_hosts`.
1. Add the public IPs into `etc_hosts` like

    18.221.175.174 master
    52.14.149.130 slave
1. Run the script

    . setup_all.sh
1. See it all happen.
1. Start all with

    ssh ubuntu@master '/usr/local/spark/sbin/start-all.sh'
1. Connect to the master node and start the shell:

    spark-shell --master spark://ip-172-31-28-157.us-east-2.compute.internal:7077 --conf spark.driver.port=12345
