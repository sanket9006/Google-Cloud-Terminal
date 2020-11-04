# Create a bucket for Spinnaker

export BUCKET=$PROJECT-spinnaker-config
gsutil mb -c regional -l us-central1 gs://$BUCKET

# Copy from another bucket to cloud shell
gsutil -m cp -R gs://spls/gsp290/dataflow-python-examples .

# Copy from cloudshell to bucket
gsutil cp gs://spls/gsp290/data_files/usa_names.csv gs://$PROJECT/data_files/
gsutil cp gs://spls/gsp290/data_files/head_usa_names.csv gs://$PROJECT/data_files/