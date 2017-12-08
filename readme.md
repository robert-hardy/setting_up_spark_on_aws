Setting up Spark on AWS from scratch
====

This repo contains scripts and readme pages that were used in a presentation that I gave at [CodeNode](https://skillsmatter.com/contact-us) in December 2017.

The idea for that talk was to show how to set up a Spark cluster on spot-requested EC2 instances and generally to give people a sense of how all the pieces fit together (EC2 security groups, key pairs, ports, environment variables, etc.).

A video recording of the talk can be found at the [Full Stack Quants website](http://fullstackquants.org/meetings/).

In the presentation I manually set up the master node (copy-pasting commands into a terminal) and then used a script to set up 2 slaves. However, this repo does
also contain notes and a script to set up a master and slave pair with a
script.

Therefore, you can follow one of 2 approaches:

1. Get 3 instances running on EC2, manually set up the master, then use a script to set up 2 slaves.
    - see instructions and things to copy-paste in `setup_master.md` (or run
script `setup_master.sh` which does it all),
    - see instructions `setup_slaves.md` and use `setup_slaves.sh` to set up
the two slaves.
2. Get 2 instances running on EC2 and use a single script `setup_all.sh` to get them both set up.

*Note*: in the presentation I opened up all ports on the EC2 instances. You
should be aware that this leaves your cluster exposed to others. It was the
easiest way to get things running within an hour, but *you should not do that*!

One approach is to open all ports but specify that the ports are accessible
only from machines in the cluster. That requires some knowledge of EC2 and you
might find it helpful to read through the `spark_ec2.py` script on [this GitHub
repo](https://github.com/amplab/spark-ec2) to see how they do it.
