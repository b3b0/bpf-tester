#!/bin/bash
CURRENTFILTER=$(cat /path/to/your/bpf.conf)
timeout 15s tshark -n -f "${CURRENTFILTER}" -i eth0 -T fields -e ip.src -e ip.dst > bpftest.txt #change eth0 to your promisc interface
cat bpftest.txt | grep 8.8.8.8 || echo "No results for 8.8.8.8" # this is optional, but can tell you if individual IPs or ranges are in the outted file.
