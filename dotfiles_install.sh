#! /usr/bin/bash

try_install () {
    sudo apt-get install -y $1
}

check_and_install () {
    configsToCheck=("nvim" "tmux" "stow" "git")

    for config in ${configsToCheck[@]};
    do
        command -v $config > /dev/null

        if [[ $? -ne 0 ]]; then
            try_install $config
        fi
    done
}

check_and_config () {
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpma

    stow nvim starship tmux
}

check_and_install

check_and_config
