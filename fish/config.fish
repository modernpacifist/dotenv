set fish_greeting
set -x EDITOR vim
set -x PATH $PATH /sbin/
set -x PATH $PATH /usr/local/go/bin/
set -x PATH $PATH $HOME/.local/bin/
set -g fish_complete_args -C
set -gx ATUIN_NOBIND "true"

abbr -a -- - 'cd -'
alias cls='clear'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias vi='nvim'
alias f='fuck'
alias pdfreader='atril'
alias cat='batcat'
alias calendar='cal -A 2'
alias t='touch'

if type -q exa
    alias l "exa -aalig --icons --color=never"
    alias ll "exa -lagi --tree --level=2 --icons --color=never"
    alias lll "exa -lagi --tree --level=3 --icons --color=never"
    alias ls "exa -aalig --icons --color=never --sort=created"
end

atuin init fish | source
thefuck --alias | source

function fish_right_prompt -d "Write time on the right"
    date "+%T"
end

function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -l last_status $status
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l prefix
    set -l suffix '>'
    if contains -- $USER root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # If we're running via SSH, change the host color.
    set -l color_host $fish_color_host
    if set -q SSH_TTY
        set color_host $fish_color_host_remote
    end

    # Write pipestatus
    set -l prompt_status (__fish_print_pipestatus " [" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

    echo -n -s (set_color $fish_color_user) "$USER" $normal @ (set_color $color_host) (prompt_hostname) $normal ' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal $prompt_status $suffix " "
end

function fish_user_key_bindings
    bind \cr _atuin_search
    bind \cc _cpwd
    bind \cd delete-char
    bind \cv vi
end

#function export_pentest_variables --on-event fish_prompt
    #for s in (grep -E '": [^\{]' ~/.pentest_values.json 2>/dev/null | sed -e 's/: /=/' -e "s/\(\,\)\$//" | tr -d \"\ )
        #export $s
    #end
#end
