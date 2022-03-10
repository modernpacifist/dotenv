set fish_greeting
set -x PYTHONSTARTUP $HOME/.pythonstartup
set -x EDITOR vim
set -x PATH $PATH /sbin/
set -x PATH $PATH /usr/local/go/bin

abbr -a -- - 'cd -'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

if type -q exa
    alias l "exa -aali --icons --color=never"
    alias ll "exa -lagi --tree --level=2 --icons --color=never"
end

function fish_right_prompt -d "Write time on the right"
    date "+%T"
end

function peco_select_history
    if test (count $argv) = 0
        set peco_flags --layout=bottom-up
    else
        set peco_flags --layout=bottom-up --query "$argv"
    end

    history|peco $peco_flags|read foo

    if [ $foo ]
        commandline $foo
    else
        commandline ''
    end
end

function fish_user_key_bindings
    bind \cr peco_select_history
    bind \cc _cpwd
    bind \cd delete-char
end

function export_pentest_variables --on-event fish_prompt
    for s in (grep -E '": [^\{]' ~/.pentest_values.json 2>/dev/null | sed -e 's/: /=/' -e "s/\(\,\)\$//" | tr -d \"\ )
        export $s
    end
end
