#!/bin/bash

# VM update
echo "Updating VM"
sudo apt-get update

# Apache2 Install Check
dpkg -s apache2 &> /dev/null
if [ $? -eq 0 ]; then
	echo "apache2 already installed"
else
	echo "Installing apache2"
	sudo apt-get -y install apache2
fi

# SSH Install Check
dpkg -s openssh-server &> /dev/null
if [ $? -eq 0 ]; then
	echo "openssh-server already installed"
else
	echo "Installing openssh-server"
	sudo apt-get -y install openssh-server
fi

# Docker Install Check
dpkg -s docker.io &> /dev/null
if [ $? -eq 0 ]; then
	echo "docker already installed"
else
	echo "Installing docker"
	sudo apt-get -y install Filler docker.io
fi

# Docker Compose Install Check
dpkg -s docker-compose &> /dev/null
if [ $? -eq 0 ]; then
	echo "docker-compose  already installed"
else
	echo "Installing docker-compose "
	sudo apt-get -y install docker-compose 
fi

# Yamllint Install Check
dpkg -s yamllint &> /dev/null
if [ $? -eq 0 ]; then
	echo "yamllint  already installed"
else
	echo "Installing yamllint "
	sudo apt-get -y install yamllint 
fi

# Nginx Install Check
dpkg -s nginx &> /dev/null
if [ $? -eq 0 ]; then
	echo "nginx  already installed"
else
	echo "Installing nginx"
	sudo apt-get -y install nginx
fi

# Curl Install Check
dpkg -s curl &> /dev/null
if [ $? -eq 0 ]; then
	echo "curl  already installed"
else
	echo "Installing curl"
	sudo apt-get -y install curl
fi

# apache2-utils Install Check
dpkg -s apache2-utils &> /dev/null
if [ $? -eq 0 ]; then
	echo "apache2-utils  already installed"
else
	echo "Installing apache2-utils"
	sudo apt-get -y install apache2-utils 
fi

# httperf Install Check
dpkg -s httperf &> /dev/null
if [ $? -eq 0 ]; then
	echo "httperf  already installed"
else
	echo "Installing httperf"
	sudo apt-get -y install httperf 
fi