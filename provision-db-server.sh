#!/bin/bash

rm /etc/ssh/sshd_config/*

apt-get update -y
apt-get upgrade -y

apt-get install mysql-server -y

sudo mysql -e "CREATE USER 'webserver'@'10.10.20.10' IDENTIFIED BY 'Admin$00';"
sudo mysql -e "GRANT PRIVILEGE ON *.* TO 'webserver'@'10.10.20.10';"