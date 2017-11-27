Delete the `master` and `slave` entries in the Macbook `/etc/hosts` and in
`~/.ssh/known_hosts`.

Get the instances running. Copy their IP addresses into the `etc_hosts` file
like

    18.221.175.174 master
    52.14.149.130 slave

Run

    source myscript.sh

Start all with

    ssh ubuntu@master '/usr/local/spark/sbin/start-all.sh'
