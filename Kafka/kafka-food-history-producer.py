# Produces messages into the Food history topic
# The message schema is {mouse},{date & time}, {food_type}, {food_portion_size}
#!/usr/bin/env python
from kafka import KafkaProducer
import time
import random
from datetime import datetime
from datetime import timedelta


kafka_url = "broker.kafka.l4lb.thisdcos.directory:9092"
topic_name = "feeding"


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
    measure_time = (start_time + timedelta(minutes=1)).strftime("%Y-%m-%d %H:%M:%S")
    for mouse_num in range(1,1000):
        food_type = random.choice(['A','B','C','D'])
        food_portion = random.choice(['Large','Small','Medium'])
        msg = "{},{},{},{}".format(mouse_num, measure_time, food_type, food_portion)
        p.send(topic_name, msg.encode("utf-8"))
    time.sleep(1)

p.flush()