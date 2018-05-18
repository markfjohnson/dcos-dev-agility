from kafka import KafkaConsumer


kafka_url = "localhost:9092"
topic_name = "example_topic"


consumer = KafkaConsumer(bootstrap_servers=kafka_url,
                             auto_offset_reset='earliest')
consumer.subscribe(topic_name)

for message in consumer:
    print (message)

consumer.close()