# create a CPU load:
dd if=/dev/urandom | gzip -9 >> /dev/null & 

# Terminate your workload generator.
kill %1