# Produces messages into the Cage temperature history topic
# The message schema is {cage},{date & time}, {temperature}
#!/usr/bin/env python
from kafka import KafkaProducer
import time
import random
from datetime import datetime
from datetime import timedelta


kafka_url = "broker.kafka.l4lb.thisdcos.directory:9092"
topic_name = "cage_temp"

def acked(err, msg):
    if err is not None:
        print("Failed to deliver message: {0}: {1}"
              .format(msg.value(), err.str()))
    else:
        print("Message produced: {0}".format(msg.value()))

print(kafka_url)
p = KafkaProducer(bootstrap_servers=kafka_url)

start_time = datetime.now()
while True:
    cage = random.randrange(1,10,1)
    temperature = random.randrange(60,100,1)
    measure_time = (start_time + timedelta(minutes=1)).strftime("%Y-%m-%d %H:%M:%S")
    msg = "{},{},{}".format(cage, temperature, measure_time).encode('utf-8')
    p.send(topic_name, msg)
    time.sleep(1)

p.flush(30)