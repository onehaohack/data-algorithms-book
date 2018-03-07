#!/bin/bash

#
# Description: 
#
#    This script finds Top-N for a given set of (K, V) pairs.
#    The assumption is that all K's are unique.
#
# @author Mahmoud Parsian
#


export BOOK_HOME=~/workspace/data-algorithms-book
export SPARK_HOME=~/soft/spark-2.2.0-bin-hadoop2.7
export SPARK_MASTER=spark://192.168.0.112:7077
export SPARK_JAR=$BOOK_HOME/lib/spark-assembly-1.6.0-hadoop2.6.0.jar
export APP_JAR=$BOOK_HOME/target/data-algorithms-1.0.0.jar
export HDFS_HOME=hdfs://localhost:9000/user/onehao

#
INPUT=$BOOK_HOME/data/top10data.txt
# Run on a Spark standalone cluster
prog=org.dataalgorithms.chap03.spark.Top10
$SPARK_HOME/bin/spark-submit \
  --class $prog \
  --master $SPARK_MASTER \
  --executor-memory 2G \
  --total-executor-cores 20 \
  $APP_JAR \
  $INPUT
