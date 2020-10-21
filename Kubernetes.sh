#1
# Start a Kubernetes cluster managed by Kubernetes Engine. Name the cluster webfrontend and configure it to run 2 nodes
gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2

# create a Kubernetes Engine cluster to deploy Spinnaker and the sample application
gcloud container clusters create spinnaker-tutorial \
    --machine-type=n1-standard-2

gcloud container clusters create awwvision \
    --num-nodes 2 \
    --scopes cloud-platform

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
#NAME                     READY   STATUS    RESTARTS   AGE
#nginx-5f7d5d7689-557b2   1/1     Running   0          114s
#nginx-5f7d5d7689-pfb69   1/1     Running   0          114s
#nginx-5f7d5d7689-rn96l   1/1     Running   0          7m48s
kubectl get pods

#5
# Expose the nginx container to the Internet
# Kubernetes created a service and an external load balancer with a public IP address attached to it. The IP address remains the same for the life of the service. 
# Any network traffic to that public IP address is routed to pods behind the service: in this case, the nginx pod
kubectl expose deployment nginx --port 80 --type LoadBalancer

#6
# View services
# kubernetes   ClusterIP      10.51.240.1     <none>         443/TCP        8m37s
# nginx        LoadBalancer   10.51.251.144   34.71.61.125   80:30805/TCP   81s
kubectl get services

#7
# Scale up the number of pods running on your service
kubectl scale deployment nginx --replicas 3