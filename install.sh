#!/bin/env bash
if [[ $UID != 0 ]]; then
    echo "You need to be root to install all features" >&2
    exit 1
fi

# Installation of binaries
for bin_file in $(ls -A ./custom-binaries/); do
    cp $bin_file /bin/
done

# Installation of dotfiles for root
for dot_file in $(ls -A ./dotfiles/); do
    cp $dot_file ~/
done

available_users=$(ls -A /home)
for username in $available_users; do
    if [[ -d /home/$username/.config/i3/ ]]; then
        cp ./i3config/config /home/$username/.config/i3/
        cp ./i3config/i3-keyboard-layout /bin/
        cp ./i3config/i3nonprimary_status.conf /etc/
        cp ./i3config/i3status.conf /etc/
    fi

    # Installation of dotfiles for all users
    if [[ -d /home/$username/ ]]; then
        for dot_file in $(ls -A ./dotfiles/); do
            cp ./dotfiles/$dot_file /home/$username/
        done
    fi

    if [[ -d /home/$username/.config/alacritty ]]; then
        cp ./alacritty/alacritty.yml /home/$username/.config/alacritty
    fi
done

exit 0
