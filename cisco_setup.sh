#!/bin/bash
# Install OpenConnect server
sudo apt-get update
sudo apt-get install -y openconnect

# Prompt for certificate and key paths
read -p "Enter the path to the SSL certificate: " ssl_cert
read -p "Enter the path to the SSL key: " ssl_key

# Prompt for running port
read -p "Enter the running port (default 443): " running_port
running_port=${running_port:-443}

# Create configuration file
config_file="/etc/openconnect/server.conf"
sudo touch $config_file
sudo chmod 600 $config_file

# Write configuration to file
echo "ssl-cert = $ssl_cert" | sudo tee -a $config_file
echo "ssl-key = $ssl_key" | sudo tee -a $config_file
echo "port = $running_port" | sudo tee -a $config_file

# Output configuration path
echo "OpenConnect server configuration file is located at $config_file"
