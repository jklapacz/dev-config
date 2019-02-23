#!/bin/bash

vim_path=${1:-$HOME/.vim}
bundle_path=$vim_path/bundle
backup_file=$(pwd)/.vimbundles

get_remote() {
    pushd $1
        git remote -v | awk '{print $2}' | sort | uniq >> $backup_file
    popd
}

mkdir -p $bundle_path
pushd $bundle_path
    for f in $(cat $backup_file); do
        git clone $f
    done
popd
