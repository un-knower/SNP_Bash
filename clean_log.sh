#!/bin/sh
rm -f /home/zk_tmp/zookeeper/version-2/log*
echo "[CLEAR] /home/zk_tmp/zookeeper/version-2/"
ls -la /home/zk_tmp/zookeeper/version-2/
pwd

rm -rf /home/hadoop/spark/hdfs_tmp/nm-local-dir
mkdir /home/hadoop/spark/hdfs_tmp/nm-local-dir
echo "[CLEAR] /home/hadoop/spark/hdfs_tmp/nm-local-dir"
ls -la /home/hadoop/spark/hdfs_tmp/nm-local-dir
pwd

rm -rf /home/zhkmxx_spark/kafka_2.10-0.10.1.0/logs
mkdir /home/zhkmxx_spark/kafka_2.10-0.10.1.0/logs
echo "[CLEAR] /home/zhkmxx_spark/kafka_2.10-0.10.1.0/logs"
ls -la /home/zhkmxx_spark/kafka_2.10-0.10.1.0/logs
pwd

rm -rf /home/zhkmxx_spark/spark/spark-1.6.2-bin-hadoop2.6/work
mkdir /home/zhkmxx_spark/spark/spark-1.6.2-bin-hadoop2.6/work
echo "[CLEAR] /home/zhkmxx_spark/spark/spark-1.6.2-bin-hadoop2.6/work"
ls -la /home/zhkmxx_spark/spark/spark-1.6.2-bin-hadoop2.6/work
pwd
