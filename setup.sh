#!/bin/bash

sudo apt update
sudo apt install vim curl jq

#Custom macro scripts#
#Add your own scripts to the scripts folder to be added to your system
######################################################################
cp -r scripts/ ~/.scripts
cat bashrc-extension.txt >> ~/.bashrc

#VIM#
#####
cp vimrc ~/.vimrc
#install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#install gruvbox
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
#install nerd-commenter
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommentor
#install nerd-tree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
#install vim-airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
#install vim-terraform
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/bundle/vim-terraform
#install vim-multi-cursors
git clone https://github.com/terryma/vim-multiple-cursors

#Install Docker-ce#
###################
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common unzip

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

#run docker without sudo

sudo usermod -aG docker ${USER}

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

#Install Bat#
#############
sudo dpkg -i bat-musl_0.9.0_amd64.deb

#Install Terraform#
###################
wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip

unzip terraform_0.11.10_linux_amd64.zip

sudo mv terraform /usr/local/bin/

terraform --version 

rm terraform_0.11.10_linux_amd64.zip

#Install aws-cli#
#################
sudo apt install python3-pip

sudo pip install awscli

#Install cert-bot#
##################
sudo add-apt-repository ppa:certbot/certbot

sudo apt-get update

sudo apt-get install python-certbot-apache

#Install terminator#
####################
sudo add-apt-repository ppa:gnome-terminator/nightly-gtk3

sudo apt update

sudo apt install terminator

exit 0
