#!/bin/bash

# Removing the SSH configuration from Vagrant and restarting the service
sudo rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
sudo systemctl restart sshd

# Updating and upgrading the VM
apt-get update -y
apt-get upgrade -y

# Installing Apache2 and PHP with all the modules to make the site work
apt-get install apache2 php libapache2-mod-php php-mysql php-mysqli php-pdo php-pdo-mysql -y

# Restarting and making sure the Apache service is working
sudo systemctl restart apache2
sudo systemctl enable apache2