""" Basic Config
set nocompatible
syntax on
filetype plugin indent on

""" General Config
set title
set number
set tabstop=4 shiftwidth=4 softtabstop=4 autoindent smarttab expandtab
set incsearch ignorecase smartcase hlsearch
set visualbell
set ruler laststatus=2 showcmd showmode
set list listchars=tab:>-,trail:·   
set backup
set backupdir=~/.config/nvim/backup
set encoding=utf-8
let mapleader = ","

""" Plugins
call plug#begin('~/.config/nvim')
     Plug 'scrooloose/nerdtree'
     Plug 'Raimondi/delimitMate'
     Plug 'tpope/vim-fugitive'
     Plug 'airblade/vim-gitgutter'
call plug#end()

" NerdTree
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeDirArrows=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
            \&& b:NERDTreeType == "primary") | q | endif

" DelimitMate
let delimitMate_expand_cr=1
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim let b:delimitMate_quotes = "\'"

""" Mappings
nnoremap <leader>t :TagbarToggle<cr>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Remap <Esc> to normal mode in terminal *nvim*
tnoremap <Esc> <C-\><C-n>
