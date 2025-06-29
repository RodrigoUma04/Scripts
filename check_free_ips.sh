#!/bin/bash

subnet="192.168.0"
used_ips=$(sudo nmap -sn ${subnet}.0/24 | grep "Nmap scan report for" | awk '{print $5}')

echo "Used IPs:"
echo "$used_ips"
echo
echo "Free IPs:"

for ip in $(seq 1 254); do
  current_ip="${subnet}.$ip"
  if ! echo "$used_ips" | grep -q "$current_ip"; then
    echo "$current_ip"
  fi
done
