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
set hidden
set signcolumn=yes
let mapleader = ","

""" Plugins
call plug#begin('~/.config/nvim')
     Plug 'scrooloose/nerdtree'
     Plug 'Raimondi/delimitMate'
     Plug 'ycm-core/YouCompleteMe'
     Plug 'tpope/vim-fugitive'
     Plug 'airblade/vim-gitgutter'
     Plug 'neovim/nvim-lspconfig'
     Plug 'nvim-lua/lsp_extensions.nvim'
     Plug 'cespare/vim-toml'
     Plug 'rust-lang/rust.vim'
     Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord

""" NerdTree
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeDirArrows=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
            \&& b:NERDTreeType == "primary") | q | endif

""" DelimitMate
let delimitMate_expand_cr=1
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim let b:delimitMate_quotes = "\'"

""" rust-analyzer
lua require'lspconfig'.rust_analyzer.setup({})

autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Code actions and diagnostics
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

let g:rustfmt_autosave = 1

""" Mappings
nnoremap <leader>t :TagbarToggle<cr>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Remap <Esc> to normal mode in terminal *nvim*
tnoremap <Esc> <C-\><C-n>
