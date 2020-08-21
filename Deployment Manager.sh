 #1
 # download an editable Deployment Manager template:
gsutil cp gs://cloud-training/gcpfcoreinfra/mydeploy.yaml mydeploy.yaml

#2
 # replace the PROJECT_ID placeholder string with your Google Cloud Platform project ID
 # replace the ZONE placeholder string with your Google Cloud Platform zone 
 sed -i -e "s/PROJECT_ID/$DEVSHELL_PROJECT_ID/" mydeploy.yaml
 sed -i -e "s/ZONE/$MY_ZONE/" mydeploy.yaml

# 3
# Build a deployment from the template:
gcloud deployment-manager deployments create my-first-depl --config mydeploy.yaml

#4
# Update a Deployment Manager deployment
# sets the value of the startup script, value: "apt-get update" to value: "apt-get update; apt-get install nginx-light -y"
nano mydeploy.yaml
change value
gcloud deployment-manager deployments update my-first-depl --config mydeploy.yaml
