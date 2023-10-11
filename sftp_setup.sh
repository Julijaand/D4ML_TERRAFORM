#!/bin/bash

# Define the SFTP server port
SFTP_PORT=15955

# SFTP server should listen on 15955 port
iptables -A INPUT -p tcp --dport $SFTP_PORT -j ACCEPT

#This port must be available only from the local network and private IP address of the executer
# Allow SSH (Port 22) traffic for the "admin" user from the local network
iptables -A INPUT -p tcp -s 172.31.0.0/16 --dport 22 -m owner --uid-owner admin -j ACCEPT

# Allow incoming HTTPS (Port 443) traffic from all source IP addresses (0.0.0.0/0)
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Drop all other incoming traffic
iptables -A INPUT -j DROP



# Save the rules to persist across reboots
# service iptables save
