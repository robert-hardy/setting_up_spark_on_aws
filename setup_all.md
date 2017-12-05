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
1. Connect to the master node and start the shell:

    spark-shell --master spark://ip-172-31-28-157.us-east-2.compute.internal:7077

1. Now run the scala snippet.

Here is some of the log on the worker:

37f3023febac/blockmgr-258587b0-270e-4be1-9375-7128c7d7ffbf
17/12/05 22:47:21 INFO MemoryStore: MemoryStore started with capacity 366.3 MB
17/12/05 22:47:21 INFO CoarseGrainedExecutorBackend: Connecting to driver: spark://CoarseGrainedScheduler@172.31.26.146:33395
17/12/05 22:47:21 INFO WorkerWatcher: Connecting to worker spark://Worker@172.31.29.13:44494
17/12/05 22:47:21 INFO TransportClientFactory: Successfully created connection to /172.31.29.13:44494 after 5 ms (0 ms spent in bootstraps)
17/12/05 22:47:21 INFO WorkerWatcher: Successfully connected to spark://Worker@172.31.29.13:44494
17/12/05 22:47:21 INFO CoarseGrainedExecutorBackend: Successfully registered with driver
17/12/05 22:47:21 INFO Executor: Starting executor ID 0 on host 172.31.29.13
17/12/05 22:47:21 INFO Utils: Successfully started service 'org.apache.spark.network.netty.NettyBlockTransferService' on port 34061.
17/12/05 22:47:21 INFO NettyBlockTransferService: Server created on 172.31.29.13:34061
17/12/05 22:47:21 INFO BlockManager: Using org.apache.spark.storage.RandomBlockReplicationPolicy for block replication policy
17/12/05 22:47:21 INFO BlockManagerMaster: Registering BlockManager BlockManagerId(0, 172.31.29.13, 34061, None)
17/12/05 22:47:21 INFO BlockManagerMaster: Registered BlockManager BlockManagerId(0, 172.31.29.13, 34061, None)
17/12/05 22:47:21 INFO BlockManager: Initialized BlockManager: BlockManagerId(0, 172.31.29.13, 34061, None)
17/12/05 22:47:21 INFO Executor: Using REPL class URI: spark://172.31.26.146:33395/classes
17/12/05 22:48:18 INFO CoarseGrainedExecutorBackend: Got assigned task 0
17/12/05 22:48:18 INFO CoarseGrainedExecutorBackend: Got assigned task 1
17/12/05 22:48:18 INFO Executor: Running task 1.0 in stage 0.0 (TID 1)
17/12/05 22:48:18 INFO Executor: Running task 0.0 in stage 0.0 (TID 0)
17/12/05 22:48:18 INFO TorrentBroadcast: Started reading broadcast variable 0
17/12/05 22:48:18 INFO TransportClientFactory: Successfully created connection to /172.31.26.146:36414 after 4 ms (0 ms spent in bootstraps)
17/12/05 22:48:18 INFO MemoryStore: Block broadcast_0_piece0 stored as bytes in memory (estimated size 1160.0 B, free 366.3 MB)
17/12/05 22:48:18 INFO TorrentBroadcast: Reading broadcast variable 0 took 127 ms
17/12/05 22:48:18 INFO MemoryStore: Block broadcast_0 stored as values in memory (estimated size 1736.0 B, free 366.3 MB)
17/12/05 22:48:18 INFO TransportClientFactory: Successfully created connection to /172.31.26.146:33395 after 8 ms (0 ms spent in bootstraps)
17/12/05 22:48:18 INFO Executor: Finished task 1.0 in stage 0.0 (TID 1). 832 bytes result sent to driver
17/12/05 22:48:18 INFO Executor: Finished task 0.0 in stage 0.0 (TID 0). 1622 bytes result sent to driver
17/12/05 22:49:22 INFO CoarseGrainedExecutorBackend: Driver commanded a shutdown
17/12/05 22:49:23 INFO MemoryStore: MemoryStore cleared
17/12/05 22:49:23 INFO BlockManager: BlockManager stopped
17/12/05 22:49:23 ERROR CoarseGrainedExecutorBackend: RECE
