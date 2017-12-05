1. Add IP address to Macbook `/etc/hosts`.

        xxx.xxx.xxx.xxx slave0
        xxx.xxx.xxx.xxx slave1

1. Put same in file `etc_hosts`, it will be written via ssh.
1. Run `. setup_slaves.sh` from Macbook.
1. Start up the slaves with

        ssh ubuntu@slave0 '/usr/local/spark/sbin/start-slave.sh spark://ip-172-31-21-131.us-east-2.compute.internal:7077'
        ssh ubuntu@slave0 '/usr/local/spark/sbin/start-slave.sh spark://ip-172-31-21-131.us-east-2.compute.internal:7077'
