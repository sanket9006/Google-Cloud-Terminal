#1 
# create the privatenet-us-vm instance, run the following command:
gcloud compute instances create privatenet-us-vm --zone=us-central1-c --machine-type=f1-micro --subnet=privatesubnet-us
gcloud compute instances create privatenet-us-vm --zone=us-central1-c --machine-type=n1-standard-1 --subnet=privatesubnet-us
gcloud compute instances create test-vm --machine-type=f1-micro --subnet=default --zone=us-central1-a
