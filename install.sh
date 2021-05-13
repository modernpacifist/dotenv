#!/bin/env bash
if [[ $UID != 0 ]]; then
    echo "You need to be root to install all features" >&2
    exit 1
fi

 Installation of binaries
for bin_file in $(ls -A ./custom-binaries/); do
    cp ./custom-binaries/$bin_file /bin/ || echo "./custom-binaries/${bin_file} was not copied"
done

# Completions for binaries
for comp_file in $(ls -A ./completions/); do
    cp ./completions/$comp_file /etc/bash_completion.d/$comp_file || echo "./completions/${comp_file} was not copied"
done

# Installation of dotfiles for root
for dot_file in $(ls -A ./dotfiles/); do
    cp ./dotfiles/$dot_file ~/ || echo "./dotfiles/${dot_file} was not copied"
done

available_users=$(ls -A /home)
for username in $available_users; do
    if [[ -d /home/$username/.config/i3/ ]]; then
        cp ./i3config/config /home/$username/.config/i3/
        cp ./i3config/i3-keyboard-layout /bin/
        cp ./i3config/i3nonprimary_status.conf /etc/
        cp ./i3config/i3status.conf /etc/
    fi

    if [[ -d /home/$username/ ]]; then
        for dot_file in $(ls -A ./dotfiles/); do
            cp ./dotfiles/$dot_file /home/$username/$dot_file
        done
    fi

    if [[ -d /home/$username/.config/alacritty ]]; then
        cp ./alacritty/alacritty.yml /home/$username/.config/alacritty
    fi

    if [[ -d /home/$username/.config/fish ]]; then
        for fish_file in $(ls -A ./fish/); do
            cp ./fish/$fish_file /home/$username/.config/fish/$fish_file
        done
        # fish completions
        for fish_comp_file in $(ls -A ./fish-completions/); do
            cp ./fish-completions/$fish_comp_file /etc/fish/completions/$fish_comp_file
        done
    fi

    if [[ -d /home/$username/.config/kitty ]]; then
        cp ./kitty/kitty.conf /home/$username/.config/kitty/
    fi
done

exit 0
