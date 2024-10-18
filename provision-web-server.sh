#!/bin/bash

rm /etc/ssh/sshd_config/*

apt-get update -y
apt-get upgrade -y

apt-get install apache2 -y