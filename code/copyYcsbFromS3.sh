
sudo rm -r /home/hadoop/ycsb-0.12.0
aws s3 cp s3://emrdevelop/hbase/code/ycsb-0.12.0/ /home/hadoop/ycsb-0.12.0 --recursive
sudo chmod 777 /home/hadoop/ycsb-0.12.0/bin/*