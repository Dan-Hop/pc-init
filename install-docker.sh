#!/bin/bash

#Install Docker-ce
##################
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

apt-cache policy docker-ce

###
#docker-ce:
#  Installed: (none)
#  Candidate: 18.03.1~ce~3-0~ubuntu
#  Version table:
#     18.03.1~ce~3-0~ubuntu 500
#        500 https://download.docker.com/linux/ubuntu bionic/stable amd64 Packages
###

sudo apt install -y docker-ce

#Run docker without sudo
########################

sudo usermod -aG docker ${USER}

#Install docker-compose
#######################
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

