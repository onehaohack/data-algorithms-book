#!/bin/bash

#
# Description: 
#
#    This script finds Top-N for a given set of (K, V) pairs.
#    This is accomplished in two basic steps:
#
#         Step-1:  aggregate keys: generate unique keys and aggregate values
#                  If your input have (K,V1), (K,V2), and (K, V3), then
#                  this phase will generate (K, V) where V = V1+V2+V3.
#
#         Step-2: find top-N for unique keys using takeOrdered() function
#
# @author Michael  Wan
#
export BOOK_HOME=~/workspace/data-algorithms-book
export SPARK_HOME=~/soft/spark-2.2.0-bin-hadoop2.7
export SPARK_MASTER=spark://192.168.0.112:7077
export SPARK_JAR=$BOOK_HOME/lib/spark-assembly-1.6.0-hadoop2.6.0.jar
export APP_JAR=$BOOK_HOME/target/data-algorithms-1.0.0.jar
export HDFS_HOME=hdfs://localhost:9000/user/onehao


#export HADOOP_HOME=/usr/local/hadoop/hadoop-2.6.0
#export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
#
INPUT=/data/chap03/input
TOPN=4
prog=org.dataalgorithms.chap03.spark.Top10UsingTakeOrdered
$SPARK_HOME/bin/spark-submit 
	--class $prog \
    --master yarn-cluster \
    --num-executors 12 \
    --driver-memory 3g \
    --executor-memory 7g \
    --executor-cores 12 \
    --conf "spark.yarn.jar=$SPARK_JAR" \
    $APP_JAR $INPUT $TOPN 
