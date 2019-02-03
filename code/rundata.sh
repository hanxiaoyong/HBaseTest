#!/bin/bash

OPERATIONCOUNT=$1
WL=$2
LOGDIR=$3
STORAGE=$4
REQUESTDISTRIBUTION=$5
RECORDCOUNT=$6

LOGFILE=/home/hadoop/ycsblog/$LOGDIR/runWorkload${WL}_${STORAGE}_based_${OPERATIONCOUNT}${REQUESTDISTRIBUTION}.log

mkdir -p /home/hadoop/ycsblog/$LOGDIR
cd /home/hadoop/ycsb-0.12.0
sudo bin/ycsb run hbase10 -P workloads/workload$WL -cp /home/hadoop/hbase/conf -p table=usertable -p columnfamily=family -p operationcount=$OPERATIONCOUNT  -p recordcount=$RECORDCOUNT -p requestdistribution=$REQUESTDISTRIBUTION -p measurementtype=timeseries -p timeseries.granularity=60000  -threads 32 > $LOGFILE
aws s3 cp $LOGFILE s3://emrdevelop/hbase/readtestlog/type=$LOGDIR/storage=$STORAGE/workload=$WL/distribution=$REQUESTDISTRIBUTION/count=$OPERATIONCOUNT/
