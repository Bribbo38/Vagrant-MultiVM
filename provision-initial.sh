#!/bin/bash

# Removing the SSH configuration from Vagrant and restarting the service
sudo rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
sudo systemctl restart sshd

# Updating and upgrading the VM
apt-get update -y
apt-get upgrade -y