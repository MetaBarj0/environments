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

:autocmd BufWinEnter *.h call DisplayTreeAndTags()
:autocmd BufWinEnter *.hpp call DisplayTreeAndTags()
:autocmd BufWinEnter *.cpp call DisplayTreeAndTags()
:autocmd BufWinEnter *.tcc call DisplayTreeAndTags()

:autocmd BufEnter *.h call FindFileInTree()
:autocmd BufEnter *.hpp call FindFileInTree()
:autocmd BufEnter *.cpp call FindFileInTree()
:autocmd BufEnter *.tcc call FindFileInTree()

set foldcolumn=0
set nocursorline
set nocursorcolumn
set ssop=blank,buffers,folds,help,options,tabpages,winsize,unix,slash,sesdir
au CursorHold * checktime
au CursorHoldI * checktime
" set comment strings. Depend on context
autocmd bufEnter,WinEnter [mM]akefile set commentstring=#%s#
autocmd bufEnter,WinEnter *.cpp set commentstring=/*%s*/
autocmd bufEnter,WinEnter *.h set commentstring=/*%s*/
autocmd bufEnter,WinEnter *.hpp set commentstring=/*%s*/
autocmd bufEnter,WinEnter *.tcc set commentstring=/*%s*/
autocmd bufEnter,WinEnter *.vim set commentstring=\"%s\"

" specific gui options
set guioptions-=r
set guioptions-=L
set guioptions-=e

" CTRL-v CTRL-c CTRL-e : Visual Comment Enable
vmap <C-v><C-c><C-e> :s/^/\/\/\ / <CR> :let @/="" <CR>

" CTRL-v CTRL-c CTRL-d : Visual Comment Disable
vmap <C-v><C-c><C-d> :s/^\/\/\ // <CR> :let @/="" <CR>

" some snippets
:iabbrev guard<c-s>
\#ifndef __HPP_<CR>
\#define __HPP_<CR><CR><CR><CR>
\#endif // __HPP_<ESC>5<UP>$4<LEFT>i

:iabbrev brief<c-s>
\/**<CR>
\\brief<CR>
\/<ESC><UP>A
