from pyspark import SparkContext, SparkConf, SQLContext
from pyspark.sql import SparkSession
from pyspark.sql import Row

warehouseLocation="/"
spark = SparkSession.builder.appName("SparkSessionHDFSExample").config("spark.sql.warehouse.dir", warehouseLocation).enableHiveSupport().getOrCreate()

sc = spark.sparkContext
values = sc.parallelize(range(1,10))
values.saveAsTextFile("hdfs://hdfs/testfile")

inp_file = sc.textFile("hdfs://hdfs/testfile")
row = Row("num") # Or some other column name
df_test = inp_file.map(row).toDF()
df_test.show()
print("Done")