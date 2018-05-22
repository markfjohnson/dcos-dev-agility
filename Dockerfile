FROM python:3.4
RUN mkdir -p /Kafka
RUN mkdir -p /conf
COPY Kafka/*.py /Kafka/
COPY conf/* /conf/

RUN pip3 install kafka-python

