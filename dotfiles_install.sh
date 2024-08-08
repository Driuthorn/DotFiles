#! /usr/bin/bash

set -x  # add debug

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
    stow nvim starship tmux
}

check_and_install

check_and_config
