set nocompatible

" ----Vundle settings----
call plug#begin()

Plug 'mg979/vim-visual-multi'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/vim-cursorword'
Plug 'google/vim-searchindex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'fatih/vim-go'
Plug 'bitfield/vim-gitgo'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'numirias/semshi'
Plug 'preservim/nerdcommenter'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }

" automatic closing brackets, etc.
Plug 'windwp/nvim-autopairs'

" completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" python code syntax check
Plug 'neomake/neomake'

" Hightlight your yank area
Plug 'machakann/vim-highlightedyank'

call plug#end()

" for windwp/nvim-autopairs
lua << EOF
require("nvim-autopairs").setup {}
require("ibl").setup()
EOF

filetype plugin indent on

syntax on
set guicursor=i:block
set number
set autoread
set encoding=utf-8
set shell=bash
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
set mouse=
set signcolumn=yes
set ignorecase

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

let g:python3_host_prog = '/usr/local/bin/python3.10'

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-pyright', 
  \ 'coc-python', 
  \ 'coc-snippets',
  \ 'coc-tabnine',
  \ 'coc-tsserver',
\ ]

" <TAB>: coc.nvim completion.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Visual multi colorscheme
let g:VM_highlight_matches = 'hi! Search ctermfg=255 ctermbg=240'
let g:VM_case_setting = 'sensitive'

let g:neomake_python_enabled_makers = ['flake8']
" Reloads buffer on its focus
autocmd FocusGained,BufEnter * :checktime
" Saves buffer on any change of data in it
autocmd FocusLost,InsertLeave,TextChanged,InsertChange * :wa

" NerdCommenter settings
map <C-_> <plug>NERDCommenterToggle
let g:NERDToggleCheckAllLines = 1

let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:snips_author="modernpacifist"

colorscheme 256_noir
autocmd BufNewFile,BufRead *.go colorscheme gitgo

noremap <F2> <Plug>(coc-rename)

noremap <F9> :q<CR>
noremap <F10> :x<CR>
noremap <F11> :xa<CR>
noremap <F12> :qa!<CR>

noremap <Leader>y "+y
noremap <Leader>p "+p

nnoremap Y Y
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

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

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

"augroup filetype_c
"    autocmd!
"    autocmd FileType c noremap <buffer> <Leader>m :w<CR>:exec '!clear && make'<CR>
"    autocmd FileType c set colorcolumn=100
"augroup END
"
"augroup filetype_cpp
"    autocmd!
"    autocmd FileType cpp noremap <buffer> <Leader>m :w<CR>:exec '!clear && make'<CR>
"    autocmd FileType cpp set colorcolumn=110
"augroup END
"
"augroup filetype_asm
"    autocmd!
"    autocmd FileType asm noremap <buffer> <Leader>m :w<CR>:exec '!clear && make'<CR>
"    autocmd FileType asm set colorcolumn=90
"augroup END
"
"augroup filetype_vim
"    autocmd FileType vim set syntax=off
"augroup END
