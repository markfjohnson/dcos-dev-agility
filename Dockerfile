FROM python:3.4
RUN mkdir -p /Kafka
ADD Kafka/ .
ADD Jenkinsfile .
RUN ls -lt
