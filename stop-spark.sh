#!/bin/bash
echo "[SNP-SPARK-CLUSTER-INFO]==========================[SNP-SPARK-CLUSTER-INFO]"
echo "[>>>>                  ]Shutting down the slaves"
$SPARK_HOME/sbin/stop-slaves.sh
echo "[>>>>>>>>>>>>>>>>>>>>>>]Slaves have been shut down"
echo "[>>>                   ]Shutting down the master"
$SPARK_HOME/sbin/stop-master.sh
echo "[>>>>>>>>>>>>>>>>>>>>>>]Master has been shut down"
echo "[>>>                   ]Shutting down the history-server"
$SPARK_HOME/sbin/stop-history-server.sh
echo "[>>>>>>>>>>>>>>>>>>>>>>]History Server has been shut down"
echo
echo "[-------- All the java process here ---------]"
jps

