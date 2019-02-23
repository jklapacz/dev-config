#!/bin/bash

CONFIG_DIR=$(pwd)
VIMRC=$CONFIG_DIR/.vimrc
VIM_DIR=$CONFIG_DIR/vim
TMUX_DIR=$CONFIG_DIR/tmux
TMUX_CONF=$TMUX_DIR/tmux.conf
TMUX_CONF_LOCAL=$TMUX_DIR/tmux.conf.local
DEPS=$CONFIG_DIR/dependencies
timestamp=$(date -u "+%Y%m%d%H%M%S")

pushd $HOME
    mv .vimrc .vimrc.backup_$timestamp
    mv .vim .vim.backup_$timestamp
    
    ln -s $VIMRC .vimrc
    ln -s $VIM_DIR .vim
    
    ln -s $TMUX_CONF .tmux.conf
    ln -s $TMUX_CONF_LOCAL .tmux.conf.local
popd

./restore_backups.sh $VIM_DIR
