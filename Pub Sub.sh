#1
# Create the Cloud Pub/Sub topic for notifications from Container Registry.
gcloud pubsub topics create projects/$PROJECT/topics/gcr

# 2
# Create a subscription that Spinnaker can read from to receive notifications of images being pushed.

gcloud pubsub subscriptions create gcr-triggers \
    --topic projects/${PROJECT}/topics/gcr