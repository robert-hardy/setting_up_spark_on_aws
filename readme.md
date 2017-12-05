Setting up Spark on AWS
====

There are 2 different approaches in this repo:

1. Manually set up the Master, then use a script to set up 2 slaves.
    See `setup_master.md` and `
2. Use a script to set up one master and one slave.


On Wednesday I got the master/slave working with all ports open (so I did not
need to bother about carefully setting the worker and driver ports). Actually,
I didn't manage to set the worker port with

    SPARK_WORKER_PORT=12346 spark-shell --master spark://ip-172-31-21-131.us-east-2.compute.internal:7077 --conf spark.driver.port=12345

Don't know why it didn't work.


Managed to run a submit job like this:

    /usr/local/spark/bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://ip-172-31-26-146.us-east-2.compute.internal:7077 /usr/local/spark/examples/jars/spark-examples_2.11-2.2.0.jar 1000

See [here](https://spark.apache.org/docs/latest/submitting-applications.html#launching-applications-with-spark-submit).
