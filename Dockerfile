FROM python:3.4
RUN mkdir -p /Kafka
ADD Kafka/*.py .
ADD conf/*

RUN pip3 install kafka-python

