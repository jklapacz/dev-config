#!/bin/bash

if [ -x "$(command -v brew)" ]; then
    echo "Brew installed!"
    brew install zsh zsh-completion
    chsh -s /bin/zsh
    brew install zplug
fi
if [ -x "$(command -v apt-get)" ]; then
    echo "apt installed!"
    sudo apt install -y zsh
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

aliases=$(pwd)/.aliases
zshrc=$(pwd)/.zshrc
backup=backup_$(date -u "+%Y%m%d%H%M%S")
pushd $HOME
    mv .aliases .aliases.$backup
    mv .zshrc .zshrc.$backup
    ln -s $aliases .aliases
    ln -s $zshrc .zshrc
popd
