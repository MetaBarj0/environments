set bkc=no
set tw=80
set formatoptions+=t
set wrap
set hlsearch
set incsearch
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab
set cindent
set backspace=2
set foldmethod=syntax

" :autocmd BufEnter *.js call FindFileInTree()
" :autocmd BufEnter *.json call FindFileInTree()

set foldcolumn=0
set nocursorline
set nocursorcolumn
set ssop=blank,buffers,folds,help,options,tabpages,winsize,unix,slash,sesdir
au CursorHold * checktime
au CursorHoldI * checktime
" set comment strings. Depend on context
autocmd bufEnter,WinEnter *.js set commentstring=/*%s*/
autocmd bufEnter,WinEnter *.vim set commentstring=\"%s\"

" specific gui options
set guioptions-=r
set guioptions-=L
set guioptions-=e

" CTRL-v CTRL-c CTRL-e : Visual Comment Enable
vmap <C-v><C-c><C-e> :s/^/\/\/\ / <CR> :let @/="" <CR>

" CTRL-v CTRL-c CTRL-d : Visual Comment Disable
vmap <C-v><C-c><C-d> :s/^\/\/\ // <CR> :let @/="" <CR>
