dcos package install --yes dcos-enterprise-cli
dcos security org service-accounts keypair spark-key.pem spark-key-pub.pem
dcos security org service-accounts create -p spark-key-pub.pem -d "Spark Service Account" "spark-dev"
dcos security secrets create-sa-secret spark-key.pem spark-dev spark-dev/spark-key

:: HDFS Service account
dcos security org service-accounts keypair hdfs-key.pem hdfs-key-pub.pem
dcos security org service-accounts create -p hdfs-key-pub.pem -d "HDFS Service Account" "hdfs-dev"
dcos security secrets create-sa-secret hdfs-key.pem hdfs-dev hdfs-dev/hdfs-key

:: kafka Service account
dcos security org service-accounts keypair kafka-key.pem kafka-key-pub.pem
dcos security org service-accounts create -p kafka-key-pub.pem -d "kafka Service Account" "kafka-dev"
dcos security secrets create-sa-secret kafka-key.pem kafka-dev kafka-dev/kafka-key

:: cassandra Service account
dcos security org service-accounts keypair cassandra-key.pem cassandra-key-pub.pem
dcos security org service-accounts create -p cassandra-key-pub.pem -d "cassandra Service Account" "cassandra-dev"
dcos security secrets create-sa-secret cassandra-key.pem cassandra-dev cassandra-dev/cassandra-key

:: mysql Service account
dcos security org service-accounts keypair mysql-key.pem mysql-key-pub.pem
dcos security org service-accounts create -p mysql-key-pub.pem -d "mysql Service Account" "mysql-dev"
dcos security secrets create-sa-secret mysql-key.pem mysql-dev mysql-dev/mysql-key

:: marathon-lb Service account
dcos security org service-accounts keypair marathon-lb-key.pem marathon-lb-key-pub.pem
dcos security org service-accounts create -p marathon-lb-key-pub.pem -d "marathon-lb Service Account" "marathon-lb-dev"
dcos security secrets create-sa-secret marathon-lb-key.pem marathon-lb-dev marathon-lb-dev/marathon-lb-key

dcos security secrets list /