:: parameters: service, service-account-name, key-base-name, description
echo on
echo "0:"$0
echo "1:"$1
echo "2:"$2
echo "3:"$3
echo "4:"$4
set SERVICE_NAME="spark-dev"
set SVC_ACCNT="spark-dev-svc-accnt"
set KEY_NAME="spark-key"
set PRIV_KEY="spark-key.pem"
set PUB_KEY="spark-key_pub.pem"
set DESCRIPTION="Service Account"

dcos security org service-accounts keypair spark-key.pem spark-key_pub.pem
dcos security org service-accounts create -p spark-key_pub.pem -d "Service Account" "spark-dev-svc-accnt"
dcos security secrets create-sa-secret spark-key.pem spark-dev-svc-accnt spark-dev/spark-key

::dcos security org users grant dcos security grant ${SVC_ACCNT} dcos:mesos:master:task:user:nobody
::dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:framework:role:*
::dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:app_id:/${SERVICE_NAME}
::dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:framework:role:*/users/<service-account-id>/create
::dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:app_id:/${SERVICE_NAME}/users/<service-account-id>/create"
::dcos security org users grant ${SVC_ACCNT} dcos:mesos:master:task:user:nobody/users/<service-account-id>/create
