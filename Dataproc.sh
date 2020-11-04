# Set the Region
gcloud config set dataproc/region global

# Create a cluster called example-cluster with default Cloud Dataproc settings:
gcloud dataproc clusters create example-cluster

# Submit a sample Spark job that calculates a rough value for pi:

gcloud dataproc jobs submit spark --cluster example-cluster \
  --class org.apache.spark.examples.SparkPi \
  --jars file:///usr/lib/spark/examples/jars/spark-examples.jar -- 1000