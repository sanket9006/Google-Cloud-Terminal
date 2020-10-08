# 1
# Create a startup script to be used by every virtual machine instance. This script sets up the Nginx server upon startup:

cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF


# 2 
# Instance Template

Key	
startup-script-url

Value
gs://cloud-training/gcpnet/httplb/startup.sh