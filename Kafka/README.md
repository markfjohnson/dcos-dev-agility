# Kafka Development using DC/OS
**TODO** Describe the HDFS Environment and demo examples

## Kafka Development considerations using DC/OS

## Part I - Developer Mode: Demo Steps
1. Log into the developer's Kafka SSH tunnel
2. Run the Python post messages job

## Part II - Test Mode: Demo Steps
1. Run the Jenkins (or GitLab) build process to the test environment
 * Run the Python post select test messages command
 * Run the Python test messages in the queue command
2. Fix the problem in the Python post program and re-run Jenkins Kafka Test Pipeline

## Part III - Production Mode: Demo Steps
1. Run the Python post select test messages into the test region as a Marathon Job - Discuss differences between Jobs and Services
2. Run the Python test messages in the queue program as a Marathon Job
 