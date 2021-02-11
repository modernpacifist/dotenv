filetype off
syntax enable
set number
set autoread
set encoding=utf-8
set wildmenu
set softtabstop=0
set shiftwidth=4
set tabstop=4
set nowrap
set smartindent
set expandtab
set nocompatible
set laststatus=0
set hidden
set ignorecase
set noswapfile
set completeopt+=menuone
set completeopt+=noinsert

"reloads changed file on terminal focus
au FocusGained,BufEnter * :checktime
:au FocusLost * :wa

"----Vundle settings----
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"----Code/project navigation----
Plugin 'mg979/vim-visual-multi'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'preservim/nerdcommenter'
Plugin 'brooth/far.vim'
Plugin '907th/vim-auto-save'
Plugin 'flazz/vim-colorschemes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/vim-cursorword'
Plugin 'google/vim-searchindex'

call vundle#end()

filetype plugin indent on

if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif

let g:kite_supported_languages = ['python']
let g:kite_completions=1
let g:kite_tab_complete=1
let g:kite_documentation_continual=1

let g:far#enable_undo=1

let g:auto_save = 1
let g:auto_save_write_all_buffers = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 110
let g:pymode_virtualenv = 1
let g:pymode_rope = 0
let g:pymode_lint_on_write = 1

colorscheme fogbell

map <F2> :wa<CR>
map <F3> :vertical resize -15<CR>
map <F4> :vertical resize +15<CR>
map <F9> :@:<CR>
map <F10> :x<CR>
map <F11> :xa<CR>
map <F12> :qa!<CR>

"Langs execution
command Cppexec !clear && g++ % && ./a.out
command Cexec !clear && gcc % && ./a.out
command Pyexec !clear && python3 %
command Asmexec !clear && nasm -f elf64 % && ld -s -o run.sh *.o && ./run.sh
