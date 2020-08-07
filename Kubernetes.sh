# Start a Kubernetes cluster
gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2

# check your installed version of Kubernetes
kubectl version

# launch a single instance of the nginx container
# kubectl create command caused Kubernetes to create a deployment consisting of a single pod containing the nginx container.
# default number of pods, is 1
kubectl create deploy nginx --image=nginx:1.17.10