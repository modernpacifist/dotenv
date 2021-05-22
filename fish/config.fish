set fish_greeting
set -x PYTHONSTARTUP $HOME/.pythonstartup

abbr -a -- - 'cd -'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

if type -q exa
  alias l "exa -l -a --icons --color=never"
  alias ll "exa -l -a -g --tree --level=2 --icons --color=never"
end

function fish_right_prompt -d "Write out the right prompt"
    date "+%T"
end

function fish_user_key_bindings
  bind \cr hstr
  bind \cc _cpwd
end
