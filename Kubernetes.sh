#1
# Start a Kubernetes cluster
gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2

#2
# check your installed version of Kubernetes
kubectl version

#3
# launch a single instance of the nginx container
# kubectl create command caused Kubernetes to create a deployment consisting of a single pod containing the nginx container.
# default number of pods, is 1
kubectl create deploy nginx --image=nginx:1.17.10

#4
# View the pod running 
kubectl get pods

#5
# Expose the nginx container to the Internet
# Kubernetes created a service and an external load balancer with a public IP address attached to it. The IP address remains the same for the life of the service. 
# Any network traffic to that public IP address is routed to pods behind the service: in this case, the nginx pod
kubectl expose deployment nginx --port 80 --type LoadBalancer

#6
# View services
kubectl get services