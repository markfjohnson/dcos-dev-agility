from kafka import KafkaConsumer


#kafka_url = "localhost:9092"
kafka_url = "broker.kafka.l4lb.thisdcos.directory:9092"
temp_topic_name = "cage_temp"


cage_temp_consumer = KafkaConsumer(bootstrap_servers=kafka_url,
                         fetch_min_bytes(1000000))
cage_temp_consumer.subscribe(temp_topic_name)

for message in cage_temp_consumer:
    print (message)

cage_temp_consumer.close()