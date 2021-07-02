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
