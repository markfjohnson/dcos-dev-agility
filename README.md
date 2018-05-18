# The Developer, Data and Analytical Agility Demo Leveraging the Awesomeness of DC/OS

**TODO** Write overview

## Demo Setup Notes
* Demo and Production work areas
* Linux dev users for Kafka, HDFS, Cassandra and MySQL are defined to all of the agent nodes
* Kafka, HDFS, Spark, Cassandra and MySQL production and test service accounts
* establish quotas on the production work area...Dev area gets what it gets
* Pre-requisites - 2 n node DC/OS cluster running.  1 cluster is for mix of production, test and development, the other for pure production.  From this we will show the linked cluster concepts

* **TODO** look into the GitLab build process and the wiki section as well - secondary requirement
* **TODO** script to provision all of the linux users in the DC/OS cluster
* **TODO** script to setup dev, test and production service accounts
* **TODO** script to setup the linked clusters
* **TODO** Systems Architecture diagram of the entire DEMO DC/OS cluster. Highlight architectural simplicity.
* **TODO** Define the data architecture for the entire demo

## Kafka Demo
* **TODO** prepare a diagram illustrating the Kafka flows
* **TODO** prepare a data diagram illustrating the Kafka to HDFS batch put operation

### Topics to Show
* Connecting to cluster via a SSH tunnel - discuss security protections
* Python code which will work both in dev mode or production cluster
* Python code to batch write data into HDFS
* Python code to write to Cassandra
* Python code to write to MySQL

### Demo Steps
1. Establish the Kafka authenticated tunnel for the dev Kafka user
2. Run from IntelliJ the python job to populate the Kafka queue
3. Run from the command line the Kafka CLI to inspect the queue
4. Run from IntelliJ the python job to write to Cassandra
5. Run from IntelliJ the python job to write to MySQL
6. Run from IntelliJ the Python job to write to HDFS

## HDFS Demo

* **TODO** prepare a data diagram illustrating the HDFS data sets 
* **TODO** Design some interesting SparkSQL to HDFS analytics

###  Topics to Show
* HDFS client access to view the existing data files
* Running a pySpark job on the HDFS data files
* **Nice to Have**: Kerberize the HDFS cluster.  This would require integrating KDC into the DC/OS cluster

### Demo Steps
1. Startup HDFS client docker image 
2. Execute standard HDFS commands to view the data files
3. Run the pySpark program to analyze a HDFS data file


## Cassandra and MySQL demo steps

###  Topics to Show
* Running a MySQL client from the developer's workstation
* Query the MySQL and Cassandra databases from the developer's workstation
* Run a Python script to query the databases

### Demo Steps
1. Setup the SSH tunnel to access MySQl and configure local MySQL client to connect through the tunnel
2. Run MySQl SELECT {some fields} FROM {some table} where {a field}={some value}
3. Run PySpark query on the Cassandra database

---

## JupyterHub

### Topics to Show
* Query HDFS, MySQL and Cassandra data
* Show results as visualizations
* Confine queries to production region where resources have quotas
* Discuss developer provisioning 

### Demo Steps
1. Log into the JupyterHub instance available to the Data Science user
2. Execute a couple of base queries on the production ?? HDFS, MySQL and Cassandra datasets
3. Show visualizations possible on the query results

## Linked && Hybrid Clusters

### Topics to Show
* Show the ability to run two clusters (Production and Dev/test) under one pane of glass and the ability to switch between the two clusters.  **Nice to Have** Have someone else on the Mesosphere side to kill some nodes during the this part of the demo and show how the cluster administration focuses not on custom snowflakes but rather just managing generic servers
* Discuss the Hybrid cloud capabilities - NO DEMO of this feature 