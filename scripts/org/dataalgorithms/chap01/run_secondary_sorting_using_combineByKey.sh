#!/bin/bash
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/
echo "JAVA_HOME=$JAVA_HOME"
# 
export BOOK_HOME=/Users/michael.wh/workspace/data-algorithms-book
export SPARK_HOME=/Users/michael.wh/workspace/spark-2.2.0-bin-hadoop2.7
export SPARK_MASTER=spark://localhost:7077
export SPARK_JAR=$BOOK_HOME/lib/spark-assembly-1.6.0-hadoop2.6.0.jar
export APP_JAR=$BOOK_HOME/target/data-algorithms-1.0.0.jar
# define input parameters
INPUT="file://$BOOK_HOME/time_series.txt"
OUTPUT="file://$BOOK_HOME/output"
#
prog=org.dataalgorithms.chap01.spark.SecondarySortUsingCombineByKey
$SPARK_HOME/bin/spark-submit  --class $prog --master $SPARK_MASTER $APP_JAR $INPUT $OUTPUT
