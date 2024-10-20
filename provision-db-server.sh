#!/bin/bash

# Removing the SSH configuration from Vagrant and restarting the service
sudo rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
sudo systemctl restart sshd

# Updating and upgrading the VM
apt-get update -y
apt-get upgrade -y

# Installing the MySQL Server
apt-get install mysql-server -y

# Setting the MySQL binding to all IP's and skipping the name resolving
echo "bind-address = 0.0.0.0" | sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf
echo "skip-name-resolve" | sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf

# Restarting the MySQL service
sudo systemctl restart mysql

# Creating the 'webserver' user and giving all the permissions
sudo mysql -e "CREATE USER 'webserver'@'10.10.20.10' IDENTIFIED BY 'Password123';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'webserver'@'10.10.20.10';"
sudo mysql -e "FLUSH PRIVILEGES;"