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
alias calendar='cal -A 2'
alias t='touch'
alias r='source ~/.config/fish/config.fish'

# git
alias gc='git checkout'
alias gcl='gitlab-ci-local'
alias gtbk='git add -A && git commit -m "backup" && git push'

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

