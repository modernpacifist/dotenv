#!/bin/env bash

function root_setup {
    find ./binfiles -type f -exec cp {} /bin/ \;

    if [[ -d /etc/bash_completion.d/ ]]; then
        find ./bash-completions -type f -exec cp {} /etc/bash_completion.d/ \;
    fi

    if [[ -d /etc/fish/completions/ ]]; then
        find ./fish-completions/ -type f -exec cp {} /etc/fish/completions/ \;
    fi
}

if [[ $EUID == 0 ]]; then
    root_setup
fi

#. dotfiles setup
find ./dotfiles -type f -exec cp {} $HOME/ \;

# i3wm setup
if [[ -d $HOME/.config/i3/ ]]; then
    find ./i3config -type f -exec cp {} $HOME/.config/i3/ \;
fi

# alacritty setup
if [[ -d $HOME/.config/alacritty ]]; then
    cp ./alacritty/alacritty.yml $HOME/.config/alacritty/
fi

# kitty setup
if [[ -d $HOME/.config/kitty ]]; then
    cp ./kitty/kitty.conf $HOME/.config/kitty/
fi

# fish setup
if [[ -d $HOME/.config/fish ]]; then
    find ./fish -type f -exec cp {} $HOME/.config/fish/ \;
fi

exit 0
