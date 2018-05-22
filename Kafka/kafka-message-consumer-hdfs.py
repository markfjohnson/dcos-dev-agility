from kafka import KafkaConsumer
from kafka import TopicPartition

# TODO create a bulk HDFS file writer approach
kafka_url = "broker.kafka.l4lb.thisdcos.directory:9092"

topic_name = "cage_temp"


cage_temp_consumer = KafkaConsumer(bootstrap_servers=kafka_url,
                                                      auto_offset_reset='earliest',
                                                      consumer_timeout_ms=1000)
cage_temp_consumer.subscribe([topic_name])
for message in cage_temp_consumer:
    print ("%s:%d:%d: key=%s value=%s" % (message.topic, message.partition,
                                          message.offset, message.key,
                                          message.value))

cage_temp_consumer.close()