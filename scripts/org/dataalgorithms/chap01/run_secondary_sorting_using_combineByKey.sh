#!/bin/bash
export JAVA_HOME=/home/onehao/soft/jdk1.8.0_121
echo "JAVA_HOME=$JAVA_HOME"
# 
export BOOK_HOME=~/workspace/data-algorithms-book
export SPARK_HOME=~/soft/spark-2.2.0-bin-hadoop2.7
export SPARK_MASTER=spark://192.168.0.112:7077
export SPARK_JAR=$BOOK_HOME/lib/spark-assembly-1.6.0-hadoop2.6.0.jar
export APP_JAR=$BOOK_HOME/target/data-algorithms-1.0.0.jar
export HDFS_HOME=hdfs://localhost:9000/user/onehao
# define input parameters
#INPUT="file://$BOOK_HOME/time_series.txt"
INPUT="hdfs://localhost:9000/user/onehao/workspace/data-algorithms-book/time_series.txt"
OUTPUT="$HDFS_HOME/output"
$HADOOP_HOME/bin/hadoop fs -rmr $OUTPUT
#
prog=org.dataalgorithms.chap01.spark.SecondarySortUsingCombineByKey
$SPARK_HOME/bin/spark-submit  --class $prog --master $SPARK_MASTER $APP_JAR $INPUT $OUTPUT
