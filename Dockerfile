FROM python:3.4
RUN mkdir -p /Kafka
ADD Kafka/kafka_producer_example.py .

RUN pip3 install kafka-python

