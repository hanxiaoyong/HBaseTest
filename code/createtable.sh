#!/bin/bash
aws s3 cp s3://emrdevelop/hbase/code/createtable.conf /home/hadoop/
hbase shell /home/hadoop/createtable.conf