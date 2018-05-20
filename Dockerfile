FROM python:3.4
ADD Kafka/*.py .
ADD Jenkinsfile .
RUN ls -lt
