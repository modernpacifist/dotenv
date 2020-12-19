filetype off
syntax enable
set softtabstop=0
set shiftwidth=4
set tabstop=4
set smartindent
set noexpandtab
set number
set mouse=
set nocompatible
set laststatus=2
set completeopt+=menuone
set completeopt+=noinsert
set completeopt-=preview
set timeoutlen=1000
set ttimeoutlen=0
set hidden
set ignorecase
set nowrap
set noswapfile

"----Vundle settings----
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"----Code/project navigation----
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'preservim/nerdcommenter'
Plugin 'brooth/far.vim'
Plugin '907th/vim-auto-save'
Plugin 'flazz/vim-colorschemes'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()

filetype plugin indent on

if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif

let g:pymode_python = 'python3'
let g:kite_supported_languages = ['python']
let g:kite_auto_complete=1
let g:kite_tab_complete=1
let g:kite_snippets=1
let g:kite_documentation_continual=1

let g:far#enable_undo=1
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_write_all_buffers = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:pymode_options_max_line_length = 110

colorscheme fogbell

map <F2> :wa<CR>
map <F3> :vertical resize -15<CR>
map <F4> :vertical resize +15<CR>
map <F5> :e<CR>
map <F10> :@:<CR>
map <F11> :xa<CR>
map <F12> :qa!<CR>

map <C-@> :@:<CR>

command Cppexec !clear && g++ % && ./a.out
command Cexec !clear && gcc % && ./a.out
command Pyexec !clear && python3 %
command Asmexec !clear && nasm -f elf64 % && ld -s -o run.sh *.o && ./run.sh
