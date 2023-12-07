" set background=light
set background=dark

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
nnoremap <Leader>xbn :bn<CR>:bd #<CR>
nnoremap <Leader>xbp :bp<CR>:bd #<CR>
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
vnoremap < <gv
vnoremap > >gv

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

" color and highlight configuration
augroup color_from_background
  au!

  au User AirlineAfterInit
    \   if &background == 'light'
    \ |   AirlineTheme google_light
    \ | else
    \ |   AirlineTheme google_dark
    \ | endif

  au VimEnter,WinEnter,BufEnter *
    \   if &background == 'light'
    \ |   hi Visual ctermbg=White
    \ |   highlight Pmenu ctermbg=lightgrey ctermfg=none
    \ |   highlight PmenuSel ctermbg=white ctermfg=none
    \ |   highlight DiffText ctermfg=lightgrey
    \ |   highlight lspReference ctermfg=none ctermbg=lightblue
    \ |   highlight PopupWindow ctermbg=lightblue ctermfg=none
    \ |   highlight Folded ctermbg=none ctermfg=lightblue
    \ | else
    \ |   hi Visual ctermbg=Black
    \ |   highlight Pmenu ctermbg=darkgrey ctermfg=none
    \ |   highlight PmenuSel ctermbg=white ctermfg=none
    \ |   highlight DiffText ctermfg=darkgrey
    \ |   highlight lspReference ctermfg=none ctermbg=darkblue
    \ |   highlight PopupWindow ctermbg=darkblue ctermfg=none
    \ |   highlight Folded ctermbg=none ctermfg=darkblue
    \ | endif
    \ | AirlineRefresh
augroup END

" terminal configuration
:tnoremap <Esc> <C-\><C-n>

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
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
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-denops/denops.vim'
Plug 'vim-denops/denops-helloworld.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc.vim'
Plug 'tani/ddc-fuzzy'
Plug 'Shougo/ddc-ui-pum'
Plug 'shougo/neco-vim'
Plug 'Shougo/ddc-source-around'
Plug 'shun/ddc-vim-lsp'
Plug 'Shougo/ddc-cmdline-history'
Plug 'Shougo/ddc-cmdline'
Plug 'w0rp/ale'
Plug 'tpope/vim-dispatch'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-abolish'
Plug 'mfussenegger/nvim-dap'
" FIXME: the following may fail, restart vim, then execute the do command as a
"        workaround
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'vim-scripts/BufOnly.vim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'rafamadriz/neon'
Plug 'rbong/vim-flog'
call plug#end()

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
let g:gitgutter_sign_removed                 = ''
let g:gitgutter_sign_removed_first_line      = ''
let g:gitgutter_sign_removed_above_and_below = ''
let g:gitgutter_sign_modified_removed        = ''

" Plug 'vim-airline/vim-airline' configuration
let g:airline_powerline_fonts             = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline_left_sep                    = ''
let g:airline_right_sep                   = ''
let g:airline_symbols.branch              = ''

" Plugin 'vim-airline/vim-airline-themes' configuration

" Plug 'majutsushi/tagbar' configuration
nmap <leader><C-t>  :TagbarOpen<CR> :wincmd p <CR>
nmap <leader><C-t>c :TagbarClose<CR>
nmap <leader><C-t>s :TagbarShowTag<CR>
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['▶', '▼']

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

" Plug 'prabirshrestha/vim-lsp' configuration
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  " expr foldmethod for cpp is not supported yet
  augroup lsp_foldmethod
    au!

    au BufRead,BufNewFile *
      \ if &ft == 'cpp'
      \ | set foldmethod=indent
      \ | else
      \ |   set foldmethod=expr
      \     foldexpr=lsp#ui#vim#folding#foldexpr()
      \     foldtext=lsp#ui#vim#folding#foldtext()
      \ |
      \ endif
  augroup END

  let g:lsp_diagnostics_enabled  = 1
  let g:lsp_text_edit_enabled    = 0
  let g:lsp_tree_incoming_prefix = "← "
  let g:lsp_hover_conceal        = 1
  let g:lsp_semantic_enabled     = 1
  let g:lsp_async_completion     = 1
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Plug 'mattn/vim-lsp-settings' configuration
let g:lsp_settings_servers_dir         = printf('%s/%s', $XDG_DATA_HOME, 'vim-lsp-servers')
let g:lsp_settings_global_settings_dir = printf('%s/%s', $XDG_DATA_HOME, 'vim-lsp-settings')

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

" tagbar stuff
let g:airline#extensions#tagbar#flags = ''
let g:airline#extensions#tagbar#searchmethod = 'nearest-stl'

" c/c++ linting
let g:ale_linters = {
\   'cpp': ['clangd'],
\   'c': ['clangd'],
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
let g:dispatch_handlers=[
\ 'job',
\ 'terminal',
\ 'headless'
\ ]

" Plug 'vim-denops/denops.vim' configuration

" Plug 'vim-denops/denops-helloworld.vim' configuration

" Plug 'Shougo/pum.vim' configuration
" Perform a plugin installation if the function below is undefined
au FuncUndefined ddc#custom#patch_global :PlugInstall

call ddc#custom#patch_global('ui', 'pum.vim')

inoremap <Tab>      <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-Tab>    <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>      <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>      <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>      <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>      <Cmd>call pum#map#cancel()<CR>
inoremap <C-PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <C-PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

" Plug 'Shougo/ddc-ui-pum' configuration
call ddc#custom#patch_global('ui', 'pum')

" Plug 'Shougo/ddc.vim' configuration
" Customize global settings
" sources
call ddc#custom#patch_global('sources', [
  \ 'necovim',
  \ 'around',
  \ 'vim-lsp',
  \ 'cmdline-history',
  \ 'cmdline'])

" specific stuff for command line completion
nnoremap : <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
  " Note: It disables default command line completion!
  set wildchar=<C-t>

  cnoremap <expr> <Tab>
    \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ ddc#map#manual_complete()
  cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
  cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
  cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

  " Overwrite sources
  if !exists('s:cmdline_prev_buffer_config')
    let s:cmdline_prev_buffer_config = ddc#custom#get_buffer()
  endif

  autocmd User DDCCmdlineLeave ++once call CommandlinePost()
  autocmd InsertEnter <buffer> ++once call CommandlinePost()

  " Enable command line completion
  call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
  silent! cunmap <Tab>
  silent! cunmap <S-Tab>
  silent! cunmap <C-y>
  silent! cunmap <C-e>

  " Restore sources
  if exists('s:cmdline_prev_buffer_config')
    call ddc#custom#set_buffer(s:cmdline_prev_buffer_config)
    unlet s:cmdline_prev_buffer_config
  else
    call ddc#custom#set_buffer({})
  endif

  set wildchar=<Tab>
endfunction

call ddc#custom#patch_global('cmdlineSources', ['cmdline'])

" global filters
call ddc#custom#patch_global('sourceOptions', #{
  \   _: #{
  \     matchers   : ['matcher_fuzzy'],
  \     sorters    : ['sorter_fuzzy'],
  \     converters : ['converter_fuzzy']}
  \ })

call ddc#custom#patch_global('autoCompleteEvents', [
  \ 'InsertEnter', 'TextChangedI', 'TextChangedP',
  \ 'CmdlineEnter', 'CmdlineChanged',
  \ ])

" Use ddc.
call ddc#enable()

" Plug 'tani/ddc-fuzzy' configuration
call ddc#custom#patch_global('filterParams', #{
  \    matcher_fuzzy: #{
  \      splitMode: 'word'
  \   }
  \ })

call ddc#custom#patch_global('filterParams', #{
  \    converter_fuzzy: #{
  \      hlGroup: 'CursorLine'
  \   }
  \ })

" Plug 'shougo/neco-vim' configuration
if !exists('g:necovim#complete_functions')
  let g:necovim#complete_functions = {}
endif

let g:necovim#complete_functions.Ref = 'ref#complete'

call ddc#custom#patch_global('sourceOptions', #{
  \   necovim: #{ mark: '`v`' }
  \ })

" Plug 'Shougo/ddc-source-around' configuration
call ddc#custom#patch_global('sourceOptions', #{
  \   around: #{ mark: '`a`' },
  \ })

call ddc#custom#patch_global('sourceParams', {
  \   'around': {'maxSize': 500},
  \ })

" Plug 'shun/ddc-vim-lsp' configuration
call ddc#custom#patch_global('sourceOptions', #{
  \   vim-lsp: #{
  \     mark: '`lsp`'
  \   },
  \ })

call ddc#custom#patch_global('sourceParams', {
  \ 'vim-lsp': {'maxSize': 500},
  \ })

" Plug 'Shougo/ddc-cmdline-history' configuration
call ddc#custom#patch_global('sourceOptions', #{
  \ cmdline-history: #{ mark: '`hist`' },
  \ })

" Plug 'Shougo/ddc-cmdline' configuration
call ddc#custom#patch_global('sourceOptions', #{
  \   cmdline: #{
  \     mark: '`cmd`'
  \   }
  \ })

" Plug 'liuchengxu/vim-clap' configuration
noremap <C-p> :Clap <CR>

let g:clap_layout = { 'relative': 'editor' }

" Plug 'bfrg/vim-cpp-modern' configuration
" Enable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" Plug 'tpope/vim-abolish' configuration

" Plug 'mfussenegger/nvim-dap' configuration
lua << EOF
local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = vim.fn.environ()['NVIM_LLDB_VSCODE_PATH'], -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.env = function()
  local variables = {}
  for k, v in pairs(vim.fn.environ()) do
    table.insert(variables, string.format("%s=%s", k, v))
  end
  return variables
end

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

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
    runInTerminal = false,
  },

  {
    name = "Attach to process",
    type = 'lldb',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
    request = 'attach',
    pid = require('dap.utils').pick_process,
    args = {},
  },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local api = vim.api

local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, 'n')
    for _, keymap in pairs(keymaps) do
      if keymap.lhs == "K" then
        table.insert(keymap_restore, keymap)
        api.nvim_buf_del_keymap(buf, 'n', 'K')
      end
    end
  end
  api.nvim_set_keymap(
    'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
end

dap.listeners.after['event_terminated']['me'] = function()
  for _, keymap in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(
      keymap.buffer,
      keymap.mode,
      keymap.lhs,
      keymap.rhs,
      { silent = keymap.silent == 1 }
    )
  end
  keymap_restore = {}
end

EOF

" Plug 'nvim-tree/nvim-tree.lua' configuration
lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
  view = {
    number = false,
    relativenumber = false,
    width = 40,
  },
  git = {
    timeout = 10000
  }
})
EOF

augroup nvim-tree
  au!

  au VimEnter * NvimTreeOpen
augroup END

nmap <leader><C-n>  :NvimTreeToggle<CR> :wincmd p <CR>
nmap <leader><C-n>f  :NvimTreeFindFile<CR> :wincmd p <CR>

" Plug 'nvim-tree/nvim-web-devicons' configuration
lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}
EOF

" Plug 'rafamadriz/neon' configuration
augroup colorscheme-neon
  au!

  au VimEnter * colorscheme neon
augroup END

" Plug 'rbong/vim-flog' configuration
