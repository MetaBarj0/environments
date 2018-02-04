set nocompatible
syntax on
set encoding=utf8
set noerrorbells
set novisualbell
set ls=2
set statusline=%f%m%r\ %l/%L:%v
set shell=/usr/local/bin/bash\ -l
set bkc=no
set noswapfile
set foldcolumn=0
colo xoria256
nnoremap t <C-]>
nnoremap ,lcd :lcd %:p:h<CR>:pwd<CR>
