#!/bin/env bash
if [[ $1 ]];
then
    dotenv_dir=$(pwd)
    # i3 configs setup done
    #cd ./i3config
    #cp config /home/$1/.config/i3/
    #cp i3-keyboard-layout /bin/
    #cp i3nonprimary_status.conf /etc/
    #cp i3status.conf /etc/
    #cd $dotenv_dir

    # dotfiles setup done
    #cd ./dotfiles
    #cp .bash_aliases /home/$1/ && cp .bash_aliases ~/
    #cp .bashrc /home/$1/ && cp .bashrc ~/
    #cp .gdbinit /home/$1/ && cp .gdbinit ~/
    #cp .inputrc /home/$1/ && cp .inputrc ~/
    #cp .vimrc /home/$1/ && cp .vimrc ~/
    #cd $dotenv_dir

    # custom-binaries setup done
    #cd ./custom-binaries
    #cp ./* /bin/
    #cd $dotenv_dir

    # alacritty config
    #cd ./alacritty
    #cp ./alacritty.yml /home/$1/.config/alacritty
    #cd $dotenv_dir

else
    echo 'Specify username in $1'
fi
