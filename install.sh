#!/bin/env bash

function root_setup {
    cp ./binfiles/* /bin/

    if [[ -d /etc/bash_completion.d/ ]]; then
        cp ./bash-completions/* /etc/bash_completion.d/
    fi

    if [[ -d /etc/fish/completions/ ]]; then
        cp ./fish-completions/* /etc/fish/completions/
    fi
}

if [[ $EUID == 0 ]]; then
    root_setup
fi

# dotfiles setup
cp ./dotfiles/* $HOME/

# i3wm setup
if [[ -d $HOME/.config/i3/ ]]; then
    cp ./i3config/* $HOME/.config/i3/
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
    cp ./fish/* $HOME/.config/fish/
fi

exit 0
