#!/bin/sh

# initialize hdfs
echo "initializing namenode"
if [ ! -d /tmp/hadoop-root/dfs ]; then
  ./bin/hdfs namenode -format
fi
echo "namenode initialized"
