#!/usr/bin/env bash
# create the necessary service accounts
exec create-service-accounts.sh spark-dev, spark-dev-svc-accnt, spark-key, "Spark service Account"


# TODO Create the Application groups for dept-a and dept-b for each of the necessary components
dcos package install --yes dcos-enterprise-cli --cli
# TODO Setup HDFS service account
dcos package install --yes hdfs --options=hdfs_option.json
dcos package install --yes marathon-lb
# TODO Setup service account for cassandra
dcos package install --yes cassandra
#TODO Setup service account for Spark
#TODO Setup spark history configuration
dcos package install --yes spark --options=spark_options.json
dcos marathon app add https://raw.githubusercontent.com/vishnu2kmohan/livy-dcos-docker/master/livy-marathon.json
dcos marathon app add https://raw.githubusercontent.com/vishnu2kmohan/beakerx-dcos-docker/master/beakerx-marathon.json

dcos marathon pod add https://raw.githubusercontent.com/markfjohnson/dcos-j2ee-legacy-examples/master/Installation/metrics.json
dcos marathon app add https://raw.githubusercontent.com/markfjohnson/dcos-j2ee-legacy-examples/master/Installation/prometheus.json
dcos marathon app add https://raw.githubusercontent.com/markfjohnson/dcos-j2ee-legacy-examples/master/Installation/grafana.json

# TODO Setup service account for mysql
dcos package install --yes mysql
#TODO Setup service account for kafka
dcos package install --yes kafka

echo "Setup security rules"
dcos security org groups create dept-a
dcos security org groups create dept-b
dcos security org users create -p password meatloaf
dcos security org users create -p password jsmith
dcos security org users create -p password jdoeinstall_ds_env.sh
dcos security org groups add_user dept-a jsmith
dcos security org groups add_user dept-b jdoe
dcos security org groups grant dept-a dcos:adminrouter:service:marathon full
dcos security org groups grant dept-a dcos:service:marathon:marathon:services:/dept-a full
dcos security org groups grant dept-a dcos:adminrouter:ops:slave full
dcos security org groups grant dept-a dcos:mesos:master:framework:role:slave_public read
dcos security org groups grant dept-a dcos:mesos:master:executor:app_id:/dept-a read
dcos security org groups grant dept-a dcos:mesos:master:task:app_id:/dept-a read
dcos security org groups grant dept-a dcos:mesos:agent:framework:role:slave_public read
dcos security org groups grant dept-a dcos:mesos:agent:executor:app_id:/dept-a read
dcos security org groups grant dept-a dcos:mesos:agent:task:app_id:/dept-a read
dcos security org groups grant dept-a dcos:mesos:agent:sandbox:app_id:/dept-a read

dcos security org groups grant dept-b dcos:adminrouter:service:marathon full
dcos security org groups grant dept-b dcos:service:marathon:marathon:services:/dept-b full
dcos security org groups grant dept-b dcos:adminrouter:package full

# TODO build a script to identify the public node and export it to a variable
./find_public_node.sh

# TODO setup quota setting scripts for the production services