#!/usr/bin/env bash
dcos spark run  --submit-args="https://raw.githubusercontent.com/markfjohnson/dcos_data_science/master/spark_hdfs/hdfs_spark_write.py" --verbose
