set nocompatible

set nobackup
set noswapfile
set autoread

set title
set number
set ruler
set cursorline
set smartindent
set virtualedit=onemore
set visualbell
set laststatus=2

syntax enable

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme nord
