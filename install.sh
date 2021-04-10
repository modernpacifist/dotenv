#!/bin/env bash
if [[ $UID != 0 ]]; then
    echo "You need to be root to install all features" >&2
    exit 1
fi

for file in $(ls -A custom-binaries); do
    cp $file /bin/
done

available_users=$(ls /home)
for username in $available_users
do
    if [[ -d /home/$username/.config/i3/ ]]; then
        cp ./i3config/config /home/$username/.config/i3/
        cp ./i3config/i3-keyboard-layout /bin/
        cp ./i3config/i3nonprimary_status.conf /etc/
        cp ./i3config/i3status.conf /etc/
    fi

    if [[ -d /home/$username/ ]]; then
        files=$(ls -A ./dotfiles/)
        for file in $files
        do
            cp ./dotfiles/$file /home/$username/
            cp ./dotfiles/$file ~/
        done
    fi

    if [[ -d /home/$username/.config/alacritty ]]; then
        cp ./alacritty/alacritty.yml /home/$username/.config/alacritty
    fi
done

exit 0
