1. Use the `all_open` security credentials.
1. Delete the `master` and `slave` entries in the Macbook `/etc/hosts` and in `~/.ssh/known_hosts`.
1. Add the public IPs into `etc_hosts` like

        18.217.205.167 master
        18.217.145.2 slave

    For the record, the public and private were:

        172.31.26.146 master private ip
        172.31.29.13 slave private ip

1. Run the script

        . setup_all.sh
1. See it all happen.
1. Connect to `master` and start all with

        /usr/local/spark/sbin/start-all.sh
1. Visit the UI of the master and get its URL.
1. Connect to the master node and start the shell, something like:

        spark-shell --master spark://ip-172-31-28-157.us-east-2.compute.internal:7077

1. Now run the scala snippet.
