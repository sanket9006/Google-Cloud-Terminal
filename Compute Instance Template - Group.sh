# 1.1
# Create a startup script to be used by every virtual machine instance. This script sets up the Nginx server upon startup:

cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF

# 1.2
# Create an instance template, which uses the startup script:

gcloud compute instance-templates create nginx-template \
         --metadata-from-file startup-script=startup.sh

# 1.3
# Create a target pool. A target pool allows a single access point to all the instances in a group and is necessary for load balancing in the future steps.

gcloud compute target-pools create nginx-pool


# 1.4
# Create a managed instance group using the instance template:

gcloud compute instance-groups managed create nginx-group \
         --base-instance-name nginx \
         --size 2 \
         --template nginx-template \
         --target-pool nginx-pool

# 1.5
# Now configure a firewall so that you can connect to the machines on port 80 via the EXTERNAL_IP addresses:

gcloud compute firewall-rules create www-firewall --allow tcp:80