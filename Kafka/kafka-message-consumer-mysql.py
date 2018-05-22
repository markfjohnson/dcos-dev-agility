from kafka import KafkaConsumer
from pyspark.sql import SparkSession
from pyspark.sql import SQLContext
from datetime import datetime

# The message schema is {cage},{date & time}, {temperature}
# Connect to Spark Session
spark = SparkSession.builder.config('spark.jars', '/Users/markjohnson/demos/dcos-dev-agility/lib/mysql-connector-java-5.1.46-bin.jar').appName("Cage-Temp-Kafka-To-MySQL").config("spark.sql.warehouse.dir", '/').enableHiveSupport().getOrCreate()
sc = spark.sparkContext
print("Start of demo program running PYSPARK 2.2")
sqlContext = SQLContext(sc)
mysql_url = "jdbc:mysql://mysql.marathon.l4lb.thisdcos.directory:3306/mouse_master"

# Specify Kafka Properties
kafka_url = "broker.kafka.l4lb.thisdcos.directory:9092"
temp_topic_name = "cage_temp"
food_topic_name = "food_history"

# Set the MYSQL Properties
# Notice the referencing of the environment secrets for the MySQL Database

mysql_prop = {
     "user": "admin",
     "password": "password",
     "Driver": "com.mysql.jdbc.Driver"
}


cage_temp_table = "cage_temp"
food_history_table = "feeding"

# Begin reading from Kafka
cage_temp_consumer = KafkaConsumer(temp_topic_name, bootstrap_servers=kafka_url,
                                   auto_offset_reset='earliest',
                                   consumer_timeout_ms=1000)

#cage_temp_consumer.subscribe([topic_name])
output_rows = []
for message in cage_temp_consumer:
    values = message.value.decode('utf8').split(',')
    newRow = ({'cage': int(values[0]),'temperature': int(values[1]), 'sensor_time':datetime.strptime(values[2],"%Y-%m-%d %H:%M:%S")})
    output_rows.append(newRow)

if (len(output_rows) > 0):
    print(len(output_rows))
    df = spark.createDataFrame(output_rows)
    print(df.count())
    df.write.jdbc(url=mysql_url, table='cage_temp', properties=mysql_prop, mode="append")
else:
    print("No Cage temp rows to save")


where = "(select count(*) from mouse_master.cage_temp) as subset"
table_count = spark.read.jdbc(mysql_url, where, properties=mysql_prop)
table_count.show()
print("cage temp update")
cage_temp_consumer.close()

## Now let's do the food history table.

# Begin reading from Kafka
food_history_consumer = KafkaConsumer(food_topic_name, bootstrap_servers=kafka_url,
                                   auto_offset_reset='earliest',
                                   consumer_timeout_ms=1000)
# Message schema:  {mouse},{date & time}, {food_type}, {food_portion_size}
output_rows = []
for message in food_history_consumer:
    values = message.value.decode('utf8').split(',')
    if len(values) == 3:
        values.append('NA')
    newRow = ({'mouse': int(values[0]),'feeding_time':datetime.strptime(values[1],"%Y-%m-%d %H:%M:%S"), 'food_type': str(values[2]), 'food_portion_size':str(values[3])})
    output_rows.append(newRow)

print(len(output_rows))
df = spark.createDataFrame(output_rows)
print(df.count())

df.write.jdbc(url=mysql_url, table=food_history_table, properties=mysql_prop, mode="append")
where = "(select count(*) from mouse_master.feeding) as subset"
table_count = spark.read.jdbc(mysql_url, where, properties=mysql_prop)
table_count.show()
print("Food_history temp update")
food_history_consumer.close()

