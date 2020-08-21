#1
# create the privatenet network
gcloud compute networks create privatenet --subnet-mode=custom

#2
# create the privatesubnet-us subnet
gcloud compute networks subnets create privatesubnet-us --network=privatenet --region=us-central1 --range=172.16.0.0/24

#3
# list the available VPC subnets (sorted by VPC network), run the following command
gcloud compute networks subnets list --sort-by=NETWORK

#4
# list the available VPC networks
gcloud compute networks list

#5
# list all the firewall rules (sorted by VPC network)
gcloud compute firewall-rules list --sort-by=NETWORK    