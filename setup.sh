#!/bin/bash

CONFIG_DIR=$(pwd)
VIMRC=$CONFIG_DIR/vimrc
VIM_DIR=$CONFIG_DIR/vim
TMUX_DIR=$CONFIG_DIR/tmux
TMUX_CONF=$TMUX_DIR/tmux.conf
TMUX_CONF_LOCAL=$TMUX_DIR/tmux.conf.local
DEPS=$CONFIG_DIR/dependencies

cd ~

cp .vimrc .vimrc.old
cp .vim .vim.old

ln -s $VIMRC .vimrc
ln -s $VIM_DIR .vim

ln -s $TMUX_CONF .tmux.conf
ln -s $TMUX_CONF_LOCAL .tmux.conf.local


mkdir $DEPS 
cd $DEPS 

git clone https://github.com/VundleVim/Vundle.vim $VIM_DIR/bundle/Vundle.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


rm $VIM_DIR/vim
