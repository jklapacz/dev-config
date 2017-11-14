#!/bin/bash

CONFIG_DIR=$(pwd)
VIMRC=$CONFIG_DIR/vimrc
VIM_DIR=$CONFIG_DIR/vim
DEPS=$CONFIG_DIR/dependencies

cd ~

cp .vimrc .vimrc.old
cp .vim .vim.old

ln -s $VIMRC .vimrc
ln -s $VIM_DIR .vim

mkdir $DEPS 
cd $DEPS 

git clone https://github.com/VundleVim/Vundle.vim $VIM_DIR/bundle/Vundle.vim



rm $VIM_DIR/vim
