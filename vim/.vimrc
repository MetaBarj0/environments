" PLUGINS
call plug#begin($HOME.'/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'Lokaltog/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-speeddating'
Plug 'tommcdo/vim-exchange'
Plug 'mbbill/undotree'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'Raimondi/delimitMate'
Plug 'kshenoy/vim-signature'
Plug 'Shougo/vimproc'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'xolox/vim-easytags'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'shougo/neocomplete.vim'
Plug 'justmao945/vim-clang'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'joonty/vdebug'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'

call plug#end()

" GENERAL CONFIGURATION
" GUI
set encoding=utf-8

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" EDITOR CONFIGURATION
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Editor options
"set hidden  " Hide buffers instead of closing them
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set nohlsearch    " don't highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set novisualbell         " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set expandtab " always use spaces instead of tab characters
set softtabstop=2   " set the number of columns for TAB

" Load colorscheme
if &t_Co >= 256 || has("gui_running")
    colorscheme bubblegum-256-dark
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

" Enter paste mode when pasting a large amount of text
set pastetoggle=<F3>

"Easy buffer navigation
nnoremap gb :ls<CR>:b!<Space>

" Tags navigation mappings{{{
map <silent> <leader>b :tjump <C-R><C-W><CR>
map <silent> <leader>B :pop<CR>

" Folding
set foldmethod=syntax
:hi Folded ctermbg=025 ctermfg=252

" File explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

" PLUGINS CONFIGURATION
" TAGBAR
nmap <F8> :TagbarToggle<CR>
autocmd FileType c,cpp,hpp,h,js,jsx,ts :TagbarOpen
let g:tagbar_iconchars = ['▸', '▾']
" LIGHTLINE
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'enable': { 'tabline': 0 },
    \ 'active' : { 'right': [['lineinfo', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'], ['percent'], ['fileformat', 'fileencoding', 'filetype']], 'left': [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified']] },
    \ 'component_expand': { 
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok '
    \ },
    \ 'component_type': {
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left'
    \ }, 
    \ 'component_function': { 'fugitive': 'LightlineFugitive', 'filename': 'LightlineFilename', 'readonly': 'LightlineReadonly', 'modified': 'LightlineModified' },
    \ 'separator': { 'left': "", 'right': "" },
    \ 'subseparator': { 'left': "", 'right': "" }
\ }

let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ]
\ }

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ""." ".branch : ''
  endif
  return ''
endfunction

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "*"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFilename()
  return  ('' != expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

" EASYMOTION
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1

" TABULAR
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a<bar> :Tabularize /<bar><CR>
vmap <Leader>a<bar> :Tabularize /<bar><CR>

" GITGUTTER
set shell=/usr/local/bin/bash
nmap <leader>hn <Plug>GitGutterNextHunk
nmap <leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
let g:gitgutter_updatetime = 250
let g:gitgutter_max_signs = 2000
let g:gitgutter_sign_added = "┃"
let g:gitgutter_sign_removed = "┃"
let g:gitgutter_sign_modified = "┃"
let g:gitgutter_sign_modified_removed = "┇"

" YANKRING
nnoremap <silent> <F11> :YRShow<CR>

" FUGITIVE
map <silent> <leader>gs :Gstatus<CR>
map <silent> <leader>gc :Gcommit<CR>
map <silent> <leader>gd :Gdiff<CR>
map <silent> <leader>gp :Gpush<CR>

" UNDOTREE
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" GIST
" list your gists
nnoremap <silent> <leader>gil :Gist -l<CR>
" post a gist with default settings
nnoremap <silent> <leader>gic :Gist<CR>
" create a gist anonimously
nnoremap <silent> <leader>gia :Gist -a<CR>
" post a gist privately
nnoremap <silent> <leader>gip :Gist -p<CR>
" edit the gist (must be open in the buffer first)
nnoremap <silent> <leader>gie :Gist -e<CR>
" delete the gist (must be open in the buffer first)
nnoremap <silent> <leader>gid :Gist -d<CR>

" EASYTAGS
let g:easytags_cmd ='/usr/local/bin/ctags'
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_auto_hightlight = 0
let g:easytags_always_enabled = 1

" VIM-TAGS
let g:vim_tags_ctags_binary = '/usr/local/bin/ctags'

" NEOCOMPLETE
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" vim-clang and neocomplete
" " disable auto completion for vim-clang
let g:clang_auto = 0
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt = 'menuone,preview'
let g:clang_cpp_completeopt = 'menuone,preview'

" use neocomplete
" input patterns
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" for c and c++
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.hpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.h =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.tcc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" NEOSNIPPETS
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory = "$HOME/.vim/bundle/vim-snippets/snippets"

" PYCLEWN
" 1. pip3 install pyclewn
" 2. python3 -c 'import clewn; clewn.get_vimball()'
" 3. vim -S pyclewn-2.3.vmb
let g:pyclewn_python="/usr/local/bin/python3"

" LIGHTLINE-ALE
let g:lightline#ale#indicator_checking = ""
let g:lightline#ale#indicator_errors = ""
let g:lightline#ale#indicator_warnings = ""
let g:lightline#ale#indicator_ok = ""

" ALE
let g:ale_linters = {
\   'haskell': ['hdevtools', 'hlint', 'stack-ghc', 'stack-build'],
\   'cpp': ['clang-check', 'clang-format']
\}
let g:ale_open_list=1
let g:ale_list_window_size=3
let g:ale_keep_list_window_open=1
let g:ale_linter_aliases = {
\  'hpp': 'cpp',
\  'h': 'cpp',
\  'tcc': 'cpp',
\}

" MULTIPLE-CURSORS
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
