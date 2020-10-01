---> Create Disk by Deleting VM 
---> Create Image using Disk 
---> Configure an Instance template using Image
---> Create the managed Instance Groups using Template


---> export LB_IP=<Enter your [LB_IP_v4] here>
---> ab -n 500000 -c 1000 http://$LB_IP/