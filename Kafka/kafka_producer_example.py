#!/usr/bin/env python
from kafka import KafkaProducer
import time

kafka_url = "broker.kafka.l4lb.thisdcos.directory:9092"
#kafka_url = "localhost:9092"
topic_name = "example_topic"
print(kafka_url)
def acked(err, msg):
    if err is not None:
        print("Failed to deliver message: {0}: {1}"
              .format(msg.value(), err.str()))
    else:
        print("Message produced: {0}".format(msg.value()))

print(kafka_url)
p = KafkaProducer(bootstrap_servers=kafka_url)

while True:
    p.send(topic_name, b"test")
    p.send(topic_name, b"\xc2Hola, mundo!")
    print("Posted msg")
    time.sleep(1)

p.flush(30)