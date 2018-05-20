FROM python:3.4
RUN mkdir -p /Kafka
ADD Kafka/ .
ADD Jenkinsfile .
RUN pip3 install kafka-python
RUN pip3 list
RUN python3 kafka_producer_example.py
