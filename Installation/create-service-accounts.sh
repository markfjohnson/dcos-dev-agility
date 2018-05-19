#!/usr/bin/env bash
dcos security org service-accounts keypair spark-key.pem spark-key-pub.pem
dcos security org service-accounts create -p spark-key_pub.pem -d "Spark Service Account" "spark-dev-svc-accnt"
dcos security org service-accounts show spark-dev
dcos security secrets create-sa-secret spark-key.pem spark-dev spark-dev/spark-key

# HDFS Service account
dcos security org service-accounts keypair hdfs-key.pem hdfs-key-pub.pem
dcos security org service-accounts create -p hdfs-key_pub.pem -d "HDFS Service Account" "hdfs-dev-svc-accnt"
dcos security org service-accounts show hdfs-dev
dcos security secrets create-sa-secret hdfs-key.pem hdfs-dev hdfs-dev/hdfs-key

# kafka Service account
dcos security org service-accounts keypair kafka-key.pem kafka-key-pub.pem
dcos security org service-accounts create -p kafka-key_pub.pem -d "kafka Service Account" "kafka-dev-svc-accnt"
dcos security org service-accounts show kafka-dev
dcos security secrets create-sa-secret kafka-key.pem kafka-dev kafka-dev/kafka-key

# cassandra Service account
dcos security org service-accounts keypair cassandra-key.pem cassandra-key-pub.pem
dcos security org service-accounts create -p cassandra-key_pub.pem -d "cassandra Service Account" "cassandra-dev-svc-accnt"
dcos security org service-accounts show cassandra-dev
dcos security secrets create-sa-secret cassandra-key.pem cassandra-dev cassandra-dev/cassandra-key

# mysql Service account
dcos security org service-accounts keypair mysql-key.pem mysql-key-pub.pem
dcos security org service-accounts create -p mysql-key_pub.pem -d "mysql Service Account" "mysql-dev-svc-accnt"
dcos security org service-accounts show mysql-dev
dcos security secrets create-sa-secret mysql-key.pem mysql-dev mysql-dev/mysql-key

dcos security secrets list /

#dcos security org users grant dcos security grant ${SVC_ACCNT} dcos:mesos:master:task:user:nobody
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:framework:role:*
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:app_id:/${SERVICE_NAME}
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:framework:role:*/users/<service-account-id>/create
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:app_id:/${SERVICE_NAME}/users/<service-account-id>/create"
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:user:nobody/users/<service-account-id>/create
