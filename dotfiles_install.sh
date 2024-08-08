#! /usr/bin/bash

try_install () {
    sudo apt-get install -y $1
}

check_and_install () {
    configsToCheck=("nvim" "tmux" "stow")

    for config in ${configsToCheck[@]};
    do
        command -v $config > /dev/null

        if [[ $? -ne 0 ]]; then
            try_install $config
        fi
    done
}

check_and_config () {

    dir=$(pwd)
    dir2=$0

    echo $dir
    echo $dir2
}

check_and_install

check_and_config
