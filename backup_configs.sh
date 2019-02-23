#!/bin/bash

vim_path=~/.vim/bundle
backup_file=~/.vimbundles

get_remote() {
    pushd $1
        git remote -v | awk '{print $2}' | sort | uniq >> $backup_file
    popd
}

for f in ${vim_path}/*; do
    if [[ -d $f ]]; then
        get_remote $f
    fi
done
