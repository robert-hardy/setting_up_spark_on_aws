Setting up Spark on AWS from scratch
====

This repo contains scripts and readme pages that were used in a presentation that I gave at [CodeNode](https://skillsmatter.com/contact-us) in December 2017.

The idea for that talk was to show how to set up a Spark cluster on spot-requested EC2 instances and generally to give people a sense of how all the pieces fit together (EC2 security groups, key pairs, ports, environment variables, etc.).

A video recording of the talk can be found at the [Full Stack Quants website](http://fullstackquants.org/meetings/).


In the presentation I manually set up the master node (copy-pasting into a
terminal) and then used a script to set up 2 slaves. However, this repo does
also contain notes and a script to set up a master and slave pair with a
script.

Therefore, you can follow one of 2 approaches:

1. Get 3 instances running on EC2, manually set up the master, then use a script to set up 2 slaves.
    - see instructions and things to copy-paste in `setup_master.md`,
    - see instructions `setup_slaves.md` and use `setup_slaves.sh` to set up
the two slaves.
2. Get 2 instances running on EC2 and use a single script `setup_all.sh` to get them both set up.


On Wednesday I got the master/slave working with all ports open (so I did not
need to bother about carefully setting the worker and driver ports). Actually,
I didn't manage to set the worker port with

    SPARK_WORKER_PORT=12346 spark-shell --master spark://ip-172-31-21-131.us-east-2.compute.internal:7077 --conf spark.driver.port=12345

Don't know why it didn't work.


Managed to run a submit job like this:

    /usr/local/spark/bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://ip-172-31-26-146.us-east-2.compute.internal:7077 /usr/local/spark/examples/jars/spark-examples_2.11-2.2.0.jar 1000

See [here](https://spark.apache.org/docs/latest/submitting-applications.html#launching-applications-with-spark-submit).
