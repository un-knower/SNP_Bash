#!/bin/bash
echo "[SNP-SPARK-CLUSTER-INFO]==========================[SNP-SPARK-CLUSTER-INFO]"
echo "[>>>>                  ]Start Master"
$SPARK_HOME/sbin/start-master.sh
echo "[>>>>>>>>>>>>>>>>>>>>>>]Master started"
echo "[>>>                   ]Start Slaves"
$SPARK_HOME/sbin/start-slaves.sh
echo "[>>>>>>>>>>>>>>>>>>>>>>]Slaves started"
echo "[>>>                   ]Start history-server"
$SPARK_HOME/sbin/start-history-server.sh
echo "[>>>>>>>>>>>>>>>>>>>>>>]History Server started"
echo
echo "[-------- All the java process here ---------]"
jps

