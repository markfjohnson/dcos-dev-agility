#!/usr/bin/env bash

# parameters: service, service-account-name, key-base-name, description
echo "0:"$0
echo "1:"$1
echo "2:"$2
echo "3:"$3
echo "4:"$4
export SERVICE_NAME="spark-dev"
export SVC_ACCNT="spark-dev-svc-accnt"
export KEY_NAME="spark-key"
export PRIV_KEY="spark-key.pem"
export PUB_KEY="spark-key_pub.pem"
export DESCRIPTION="Service Account"
echo "A"
dcos security org service-accounts keypair spark-key.pem spark-key-pub.pem 
ls -lt
dcos security org service-accounts create -p spark-key_pub.pem -d "Service Account" "spark-dev-svc-accnt"
echo "C"
dcos security org service-accounts show ${SVC_ACCNT}
echo "D"
dcos security secrets create-sa-secret ${KEY_NAME}.pem ${SVC_ACCNT} ${SERVICE_NAME}/${KEY_NAME}
echo "E"

dcos security secrets list /

#dcos security org users grant dcos security grant ${SVC_ACCNT} dcos:mesos:master:task:user:nobody
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:framework:role:*
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:app_id:/${SERVICE_NAME}
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:framework:role:*/users/<service-account-id>/create
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:app_id:/${SERVICE_NAME}/users/<service-account-id>/create"
#dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:user:nobody/users/<service-account-id>/create
