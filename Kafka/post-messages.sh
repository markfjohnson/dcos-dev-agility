#!/usr/bin/env bash
# TODO call a python script to post the messages and try and specify which region by enabling the spark namespace
dcos spark run  --submit-args="https://raw.githubusercontent.com/markfjohnson/dcos_data_science/master/spark_hdfs/hdfs_spark_write.py" --verbose

# TODO enable Textexpander to setup a typing metric for the Kafka DCOS cli queue inspection