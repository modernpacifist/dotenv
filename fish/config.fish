set fish_greeting
set -x EDITOR nvim
set -x PATH $PATH /sbin/
set -x PATH $PATH /usr/local/go/bin/
set -x PATH $PATH /usr/local/go/bin/
set -x PATH $PATH $HOME/.local/bin/
set -x PATH $PATH /opt/nvim-linux64/bin/
set -x PATH $PATH $HOME/go/bin
set -g fish_complete_args -C
set -gx ATUIN_NOBIND "true"
set -gx NVM_DIR $HOME/.nvm

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
alias c='batcat'
alias calendar='ncal -A 2 -M'
alias t='touch'
alias r='source ~/.config/fish/config.fish'
alias timestamp='date +%Y%s'

# git
alias ga='git add'
alias gs='git status'
alias gpl='git pull'
alias gtpsh='git push'
alias gc='git checkout'
alias gb='git branch'
alias gdf='git diff'
alias gcl='gitlab-ci-local'
alias gcm='git commit -m'

alias gtbk='git add -A && git commit -m "Backup" && git push'

# docker
alias d='docker'
alias dil='docker image ls --all'
alias dcl='docker container ls --all'
alias dcp='docker container prune'
alias dip='docker image prune'
alias dsp='docker system prune'
alias dps='docker ps --all'

# exa
if type -q exa
    alias l "exa -aalig --icons --color=never"
    alias ll "exa -lagi --tree --level=2 --icons --color=never"
    alias lll "exa -lagi --tree --level=3 --icons --color=never"
    alias ls "exa -aalig --icons --color=never --sort=created"
end

atuin init fish | source
thefuck --alias | source

function fish_user_key_bindings
    bind \cr _atuin_search
    bind \cc _cpwd
    bind \cd delete-char
    bind \cv vi
end

function nvm
    bash -c "source $HOME/.nvm/nvm.sh; nvm $argv"
end

#function export_pentest_variables --on-event fish_prompt
    #for s in (grep -E '": [^\{]' ~/.pentest_values.json 2>/dev/null | sed -e 's/: /=/' -e "s/\(\,\)\$//" | tr -d \"\ )
        #export $s
    #end
#end

#function fish_prompt
      #set_color purple
      #date
      #set_color FF0
      #echo (pwd)
      #set_color green
      #echo (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
      #set_color normal
#end

function loadenv
    argparse h/help print printb U/unload -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: loadenv [OPTIONS] [FILE]"
        echo ""
        echo "Export keys and values from a dotenv file."
        echo ""
        echo "Options:"
        echo "  --help, -h      Show this help message"
        echo "  --print         Print env keys (export preview)"
        echo "  --printb        Print keys with surrounding brackets"
        echo "  --unload, -U    Unexport all keys defined in the dotenv file"
        echo ""
        echo "Arguments:"
        echo "  FILE            Path to dotenv file (default: .env)"
        return 0
    end

    if test (count $argv) -gt 1
        echo "Too many arguments. Only one argument is allowed. Use --help for more information."
        return 1
    end

    set -l dotenv_file ".env"
    if test (count $argv) -eq 1
        set dotenv_file $argv[1]
    end

    if not test -f $dotenv_file
        echo "Error: File '$dotenv_file' not found in the current directory."
        return 1
    end

    set -l mode load
    if set -q _flag_print
        set mode print
    else if set -q _flag_printb
        set mode printb
    else if set -q _flag_unload
        set mode unload
    end

    set lineNumber 0

    for line in (cat $dotenv_file)
        set lineNumber (math $lineNumber + 1)

        # Skip empty lines and comment lines
        if string match -qr '^\s*$|^\s*#' $line
            continue
        end

        if not string match -qr '^[A-Za-z_][A-Za-z0-9_]*=' $line
            echo "Error: invalid declaration (line $lineNumber): $line"
            return 1
        end

        # Parse key and value
        set -l key (string split -m 1 '=' $line)[1]
        set -l after_equals_sign (string split -m 1 '=' $line)[2]

        set -l value
        set -l double_quoted_value_regex '^"(.*)"\s*(?:#.*)*$'
        set -l single_quoted_value_regex '^\'(.*)\'\s*(?:#.*)*$'
        set -l plain_value_regex '^([^\'"\s]*)\s*(?:#.*)*$'
        if string match -qgr $double_quoted_value_regex $after_equals_sign
            set value (string match -gr $double_quoted_value_regex $after_equals_sign)
        else if string match -qgr $single_quoted_value_regex $after_equals_sign
            set value (string match -gr $single_quoted_value_regex $after_equals_sign)
        else if string match -qgr $plain_value_regex $after_equals_sign
            set value (string match -gr $plain_value_regex $after_equals_sign)
        else
            echo "Error: invalid value (line $lineNumber): $line"
            return 1
        end

        switch $mode
            case print
                echo "$key=$value"
            case printb
                echo "[$key=$value]"
            case load
                set -gx $key $value
            case unload
                set -e $key
        end
    end

end
