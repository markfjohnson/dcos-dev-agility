FROM python:3.4
RUN mkdir -p /Kafka
ADD Kafka/ .

RUN pip3 install kafka-python
RUN python3 kafka_producer_example.py
