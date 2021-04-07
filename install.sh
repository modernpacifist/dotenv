#!/bin/env bash
if [[ $1 ]];
then
    # i3 configs setup done
    cp ./i3config/config /home/$1/.config/i3/
    cp ./i3config/i3-keyboard-layout /bin/
    cp ./i3config/i3nonprimary_status.conf /etc/
    cp ./i3config/i3status.conf /etc/

    # dotfiles setup done
    cp ./dotfiles/.bash_aliases /home/$1/ && cp .bash_aliases ~/
    cp ./dotfiles/.bashrc /home/$1/ && cp .bashrc ~/
    cp ./dotfiles/.gdbinit /home/$1/ && cp .gdbinit ~/
    cp ./dotfiles/.inputrc /home/$1/ && cp .inputrc ~/
    cp ./dotfiles/.vimrc /home/$1/ && cp .vimrc ~/

    # custom-binaries setup done
    cp ./custom-binaries/* /bin/

    # alacritty config
    alacritty_config_dir=/home/$1/.config/alacritty
    if [[ -d $alacritty_config_dir ]]; then
        cp ./alacritty/alacritty.yml $alacritty_config_dir
    fi

    exit 0
else
    echo 'Specify username in $1'
    exit 1
fi
