#!/bin/bash

# Installing the MySQL Server
apt-get install mysql-server -y

# Setting the MySQL binding to all IP's and skipping the name resolving
echo "bind-address = 0.0.0.0" | tee -a /etc/mysql/mysql.conf.d/mysqld.cnf
echo "skip-name-resolve" | tee -a /etc/mysql/mysql.conf.d/mysqld.cnf

# Restarting the MySQL service
systemctl restart mysql

# Creating the 'webserver' user and giving all the permissions
mysql -e "CREATE USER 'webserver'@'10.10.20.10' IDENTIFIED BY 'Password123';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'webserver'@'10.10.20.10';"
mysql -e "FLUSH PRIVILEGES;"

# Creating Database with a table and some data
mysql -e "CREATE DATABASE test_db;"
mysql -e "CREATE TABLE test_db.users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(25) NOT NULL, surname VARCHAR(35) NOT NULL);"
mysql -e "INSERT INTO test_db.users(name, surname) VALUES ('Tom', 'Schillerwein'),('Matteo', 'Terranova'),('Nicolas', 'Ghiggi'),('Keisy', 'Rodriguez');"