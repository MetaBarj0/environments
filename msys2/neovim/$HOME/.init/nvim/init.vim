" light environment, if dark, change those values
set background=light
hi Visual ctermbg=White
" set background=dark
" hi Visual ctermbg=Black

let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" set the window working directory for currently edited file
nmap <silent> <leader>lcd :lcd %:p:h<CR>

" buffer configuration
set hidden " Hide buffers instead of closing them
" easy buffer navigation
nnoremap gb :ls<CR>:b!<Space>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>btp :tabnew %<CR>:tabp<CR>:bp<CR>:tabn<CR>
nnoremap <Leader>btn :tabnew %<CR>:tabp<CR>:bn<CR>:tabn<CR>

" tab and indentation
set tabstop=2     " a tab is two spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2 " set the number of columns for TAB
set expandtab     " always use spaces instead of tab characters
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" editor options
set backspace=indent,eol,start
set nowrap
set number
set novisualbell " don't beep
set noerrorbells " don't beep
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class

" search behavior
set showmatch    " set show matching parenthesis
set smartcase    " ignore case if search pattern is all lowercase case-sensitive otherwise
set nohlsearch   " don't highlight search terms
set incsearch    " show search matches as you type
set history=1000 " remember more commands and search history

" Folding
hi Folded ctermbg=none ctermfg=blue

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/YankRing.vim'
Plug 'tommcdo/vim-exchange'
Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'
Plug 'mg979/vim-visual-multi'
Plug 'sheerun/vim-polyglot'
Plug 'myusuf3/numbers.vim'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-denops/denops.vim'
Plug 'vim-denops/denops-helloworld.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc.vim'
Plug 'tani/ddc-fuzzy'
Plug 'shougo/neco-vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-dispatch'
Plug 'mfussenegger/nvim-dap'
call plug#end()

" Plug 'scrooloose/nerdtree' configuration
nnoremap <leader><C-n>  :NERDTreeMirror<CR>:NERDTreeFocus<CR>
nnoremap <leader><C-n>t :NERDTreeToggle<CR>:wincmd p<CR>
nnoremap <leader><C-n>f :NERDTreeFind<CR>:wincmd p<CR>
autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowLineNumbers=0

let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

" Plug 'airblade/vim-gitgutter'
set updatetime=300
highlight SignColumn ctermbg      = none
highlight GitGutterAdd ctermfg    = 2
highlight GitGutterChange ctermfg = 3
highlight GitGutterDelete ctermfg = 1
let g:gitgutter_updatetime                   = 250
let g:gitgutter_max_signs                    = 2000
let g:gitgutter_set_sign_backgrounds         = 0
let g:gitgutter_sign_added                   = '✚'
let g:gitgutter_sign_modified                = '✹'
let g:gitgutter_sign_removed                 = '✖'
let g:gitgutter_sign_removed_first_line      = ''
let g:gitgutter_sign_removed_above_and_below = ''
let g:gitgutter_sign_modified_removed        = ''

" Plug 'vim-airline/vim-airline' configuration
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline_left_sep                    = ''
let g:airline_right_sep                   = ''

" Plugin 'vim-airline/vim-airline-themes' configuration
let g:airline_theme = 'light'

" Plug 'majutsushi/tagbar' configuration
nmap <leader><C-t>  :TagbarOpen<CR> :wincmd p <CR>
nmap <leader><C-t>c :TagbarClose<CR>
nmap <leader><C-t>s :TagbarShowTag<CR>
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['▶', '▼']

" Plug 'ctrlpvim/ctrlp.vim' configuration

" Plug 'tpope/vim-commentary' configuration

" Plug 'easymotion/vim-easymotion' configuration
hi EasyMotionTarget ctermbg = White ctermfg = green
hi EasyMotionShade  ctermbg = none ctermfg  = blue
let g:EasyMotion_smartcase = 1

hi EasyMotionTarget2First ctermbg  = White ctermfg = green
hi EasyMotionTarget2Second ctermbg = White ctermfg = green

hi EasyMotionMoveHL ctermbg    = green ctermfg = black
hi EasyMotionIncSearch ctermbg = green ctermfg = black

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen

hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

" Plug 'haya14busa/incsearch.vim' configuration

" Plug 'haya14busa/incsearch-easymotion.vim' configuration
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" Plug 'junegunn/vim-easy-align' configuration
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ea <Plug>(EasyAlign)

" Plug 'tpope/vim-surround'

" Plug 'tpope/vim-speeddating' configuration

" Plug 'tpope/vim-repeat' configuration

" Plug 'vim-scripts/YankRing.vim' configuration
nnoremap <silent> <Leader>y :YRShow<CR>
let g:yankring_replace_n_pkey = '<M-lt>'
let g:yankring_replace_n_nkey = '<M->>'
let g:yankring_history_dir    = '$XDG_STATE_HOME'

" Plug 'tommcdo/vim-exchange' configuration

" Plug 'mbbill/undotree' configuration
let g:undotree_WindowLayout = 4
nnoremap <silent> <Leader>u :UndotreeToggle<CR> :UndotreeFocus<CR>

" Plug 'kshenoy/vim-signature' configuration
let g:SignaturePurgeConfirmation = 1

" Plug 'mg979/vim-visual-multi' configuration

" Plug 'sheerun/vim-polyglot' configuration

" Plug 'myusuf3/numbers.vim'
let g:numbers_exclude = ['tagbar', 'nerdtree', 'undotree']

" Plug 'tenfyzhong/CompleteParameter.vim'
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
nmap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
nmap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

set cmdheight=2
let g:complete_parameter_log_level             = 5
let g:complete_parameter_use_ultisnips_mapping = 0
let g:complete_parameter_echo_signature        = 1

" Plug 'prabirshrestha/vim-lsp' configuration
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  set foldmethod=expr
    \ foldexpr=lsp#ui#vim#folding#foldexpr()
    \ foldtext=lsp#ui#vim#folding#foldtext()

  " ALE takes care of linting stuff
  let g:lsp_diagnostics_enabled = 0

  highlight lspReference ctermfg=none ctermbg=blue

  " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Plug 'mattn/vim-lsp-settings' configuration
let g:lsp_settings_servers_dir = printf('%s\%s', $XDG_DATA_HOME, 'vim-lsp-servers')

" deno's hover capabilities
let g:lsp_settings_filetype_typescript = ['deno']
let g:markdown_fenced_languages = ['ts=typescript']

" Plug 'w0rp/ale' configuration
" ALE stuff
let g:airline#extensions#ale#enabled         = 1
let airline#extensions#ale#error_symbol      = ''
let airline#extensions#ale#warning_symbol    = ''
let airline#extensions#ale#show_line_numbers = 1
let airline#extensions#ale#open_lnum_symbol  = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'

" CtrlP stuff
let g:airline#extensions#ctrlp#color_template      = 'insert'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1

" fugitive stuff
let g:airline#extensions#fugitiveline#enabled = 1

" needs msys2 extra (rootmount script). There is a glitch when commiting
" a file using the original cc nmap. The current working director is appended
" with the posix form of the absolute file path of the COMMIT_EDITMSG file.
augroup fugitive_workaround_msys2
  autocmd!
  autocmd FileType fugitive nnoremap <buffer> cc :lcd $ROOTMOUNT<CR> :Git commit<CR>
  autocmd FileType fugitive nnoremap <buffer> ca :lcd $ROOTMOUNT<CR> :Git commit --amend<CR>
augroup END

" NERDTree stuff
let g:airline#extensions#nerdtree_statusline = 1

" tagbar stuff
let g:airline#extensions#tagbar#flags = ''
let g:airline#extensions#tagbar#searchmethod = 'nearest-stl'

" c/c++ linting
let g:ale_linters = {
\   'cpp': ['clangcheck', 'clangformat', 'clangtidy', 'clang', 'clangd']
\}
let g:ale_linter_aliases = {
\  'h': 'cpp',
\  'hpp': 'cpp',
\  'cxx': 'cpp',
\  'c++': 'cpp',
\  't++': 'cpp',
\  'txx': 'cpp',
\  'hxx': 'cpp',
\  'h++': 'cpp',
\  'tpp': 'cpp',
\}

" Plug 'tpope/vim-dispatch' configuration
let g:tmux_session = 1

" Plug 'mfussenegger/nvim-dap' configuration
" C/C++/Rust via lldb-vscode
" Ensure you've installed the llvm toolchain:
" pacman -S mingw-w64-clang-x86_64-toolchain
lua <<EOI

local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/clang64/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end

      return variables
    end,


    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
  {
    -- If you get an "Operation not permitted" error using this, try disabling YAMA:
    --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    name = "Attach to process",
    type = 'cpp',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
    request = 'attach',
    pid = require('dap.utils').pick_process,
    args = {},
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end

      return variables
    end,
  },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp

EOI

" Plug 'vim-denops/denops.vim' configuration

" Plug 'vim-denops/denops-helloworld.vim' configuration

" Plug 'Shougo/pum.vim' configuration
inoremap <Tab>      <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab>    <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>      <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>      <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>      <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>      <Cmd>call pum#map#cancel()<CR>
inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

" Plug 'Shougo/ddc.vim' configuration
" Customize global settings
" sources
call ddc#custom#patch_global('sources', ['necovim'])

" filters
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \ 'matchers':   ['matcher_fuzzy'],
      \ 'sorters':    ['sorter_fuzzy']},
      \ 'converters': ['converter_fuzzy']
      \ })

" " Change source options
" call ddc#custom#patch_global('sourceOptions', {
"       \ 'around': {'mark': 'A'},
"       \ })
" call ddc#custom#patch_global('sourceParams', {
"       \ 'around': {'maxSize': 500},
"       \ })

" " Customize settings on a filetype
" call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
" call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
"       \ 'clangd': {'mark': 'clangd'},
"       \ })
" call ddc#custom#patch_filetype('markdown', 'sourceParams', {
"       \ 'around': {'maxSize': 500},
"       \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
  \ ddc#map#pum_visible() ? '<C-n>' :
  \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
  \ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()

" Plug 'tani/ddc-fuzzy' configuration
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('filterParams', {
  \   'matcher_fuzzy': {
  \   'splitMode': 'word'
  \  },
  \  'converter_fuzzy': {
  \    'hlGroup': 'SpellBad'
  \  }
  \})

" Plug 'shougo/neco-vim' configuration
if !exists('g:necovim#complete_functions')
  let g:necovim#complete_functions = {}
endif

let g:necovim#complete_functions.Ref = 'ref#complete'

call ddc#custom#patch_global('sourceOptions', {
  \   'necovim': {'mark': 'vim'}
  \ })

