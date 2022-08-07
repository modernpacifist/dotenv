set nocompatible

" ----Vundle settings----
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mg979/vim-visual-multi'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/vim-cursorword'
Plugin 'google/vim-searchindex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'klen/python-mode'
Plugin 'itchyny/vim-gitbranch'
Plugin 'fatih/vim-go'
Plugin 'bitfield/vim-gitgo'
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()

filetype plugin indent on

syntax on
set number
set autoread
set encoding=utf-8
set shell=fish
set wildmenu
set softtabstop=0
set shiftwidth=4
set tabstop=4
set nowrap
set smartindent
set autoindent
set expandtab
set hidden
set noic
set incsearch
set showcmd
set noswapfile
set ttimeout
set timeoutlen=5000
set ttimeoutlen=0
set completeopt+=longest,menuone,noinsert
set completeopt-=preview
set updatetime=100
set laststatus=2
set background=dark
set cursorline
set number relativenumber
set splitright
set splitbelow

set statusline+=%#LineNr#
set statusline+=\ [%{gitbranch#name()}]
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


" Reloads buffer on its focus
autocmd FocusGained,BufEnter * :checktime
" Saves buffer on any change of data in it
autocmd FocusLost,InsertLeave,TextChanged,InsertChange * :wa

" NerdCommenter settings
map <C-_> <plug>NERDCommenterToggle
let g:NERDToggleCheckAllLines = 1

let g:pymode_python = 'python3'
let g:pymode_lint_checkers = ['pep8', 'pyflakes']
let g:pymode_options_max_line_length = 110
let g:pymode_lint_on_fly = 1
let g:pymode_virtualenv = 1
let g:pymode_motion = 0
let g:pymode_rope = 0
let g:pymode_run = 0
let g:pymode_lint_ignore = "E155"

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0

let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:snips_author="modernpacifist"


colorscheme fogbell

noremap <F9> :q<CR>
noremap <F10> :x<CR>
noremap <F11> :xa<CR>
noremap <F12> :qa!<CR>

noremap <Leader>y "+y
noremap <Leader>p "+p

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" substitute word under cursor
nnoremap <Leader>s :argdo %s/\<<C-r><C-w>\>//gIe<Left><Left><Left><Left>

" tabs management 
nnoremap <Leader>tk  :tabnext<CR>
nnoremap <Leader>tj  :tabprev<CR>
nnoremap <Leader>t< :-tabmove<CR>
nnoremap <Leader>t> :+tabmove<CR>
nnoremap <Leader>tw  :tabclose<CR>
nnoremap <Leader>tn  :tabnew<Space>

nnoremap <Leader>t1  :tabn 1<CR>
nnoremap <Leader>t2  :tabn 2<CR>
nnoremap <Leader>t3  :tabn 3<CR>
nnoremap <Leader>t4  :tabn 4<CR>
nnoremap <Leader>t5  :tabn 5<CR>
nnoremap <Leader>t6  :tabn 6<CR>
nnoremap <Leader>t7  :tabn 7<CR>
nnoremap <Leader>t8  :tabn 8<CR>
nnoremap <Leader>t9  :tabn 9<CR>
nnoremap <Leader>t0  :tabn 10<CR>

" markdown preview
let vim_markdown_preview_hotkey='<Nop>'
nnoremap <Leader>mp  :call Vim_Markdown_Preview()<CR>

" windows management
nnoremap <Leader>vs  :vsplit<Space>
nnoremap <Leader>hs  :split<Space>

" disable of default shortcuts
nnoremap <S-k> <Nop>

" gitblame
fun! GitCommand(command)
  silent! !clear
  exec "!git " . a:command . " %"
endfun
nnoremap <leader>gb :call GitCommand("blame") <CR>

inoremap <M-J> <Down>
inoremap <M-K> <Up>
inoremap <M-H> <Left>
inoremap <M-L> <Right>

augroup filetype_c
    autocmd!
    autocmd FileType c noremap <buffer> <Leader>m :w<CR>:exec '!clear && make'<CR>
    autocmd FileType c set colorcolumn=100
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp noremap <buffer> <Leader>m :w<CR>:exec '!clear && make'<CR>
    autocmd FileType cpp set colorcolumn=110
augroup END

augroup filetype_asm
    autocmd!
    autocmd FileType asm noremap <buffer> <Leader>m :w<CR>:exec '!clear && make'<CR>
    autocmd FileType asm set colorcolumn=90
augroup END

augroup filetype_vim
    autocmd FileType vim set syntax=off
augroup END

augroup filetype_go
    autocmd!
    " Enable syntax for go 
    autocmd BufNewFile,BufRead *.go colorscheme gitgo
augroup END

"autocmd BufEnter * colorscheme default
