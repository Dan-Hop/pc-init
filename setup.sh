#!/bin/bash

sudo apt update
sudo apt install vim curl

#VIM#
#####
cp vimrc ~/.vimrc
cp -r scripts/ ~/.scripts
cat bashrc-extension.txt >> ~/.bashrc
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

#Install Docker-ce#
###################
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

#run docker without sudo

sudo usermod -aG docker ${USER}

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version


exit 0
