#!/bin/bash

sudo rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
sudo systemctl restart sshd

apt-get update -y
apt-get upgrade -y

apt-get install apache2 php -y

sudo systemctl restart apache2