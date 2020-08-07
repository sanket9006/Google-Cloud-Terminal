# Start a Kubernetes cluster
gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2

#check your installed version of Kubernetes
kubectl version