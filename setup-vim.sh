#!/bin/bash

#comment install pathogen
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
