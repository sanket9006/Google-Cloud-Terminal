#1
ping -c 3 <Enter server-2's external IP address here>
This works because the VM instances can communicate over the internet.

# 2
ping -c 3 <Enter server-2's internal IP address here>
You should see 100% packet loss when pinging the internal IP address because you don't have VPN connectivity yet.


