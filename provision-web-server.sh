#!/bin/bash

# Updating and upgrading the VM
apt-get update -y
apt-get upgrade -y

# Installing Apache2 and PHP with all the modules to make the site work
apt-get install apache2 php libapache2-mod-php php-mysql php-mysqli php-pdo php-pdo-mysql -y

# Restarting and making sure the Apache service is working
sudo systemctl restart apache2
sudo systemctl enable apache2