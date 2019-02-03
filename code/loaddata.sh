
#!/bin/bash
RECORDCOUNT=$1
LOGDIR=$2
STORAGE=$3
WL=$4
LOGFILE=/home/hadoop/ycsblog/$LOGDIR/loaddataTo${STORAGE}_based_${RECORDCOUNT}_workload${WL}.log

mkdir -p /home/hadoop/ycsblog/$LOGDIR
cd /home/hadoop/ycsb-0.12.0
sudo ./bin/ycsb load hbase10 -P workloads/workload$WL -cp /home/hadoop/hbase/conf -p table=usertable -p columnfamily=family -p recordcount=$RECORDCOUNT -p measurementtype=timeseries -p timeseries.granularity=60000 -threads 32 > $LOGFILE
aws s3 cp $LOGFILE s3://emrdevelop/hbase/writetestlog/type=$LOGDIR/storage=$STORAGE/workload=$WL/count=$RECORDCOUNT/
