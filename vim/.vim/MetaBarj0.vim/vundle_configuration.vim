" vundle configuration
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

let g:vundle_default_git_proto = 'git'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" YouCompleteMe plugin
Plugin 'Valloric/YouCompleteMe'

" w0rp/ale (linting engine)
Plugin 'w0rp/ale'

" statusline
Plugin 'vim-airline/vim-airline'

" tlib
Plugin 'tlib'

" tselectbuffer
Plugin 'tselectbuffer'

" Tag bar
Plugin 'tagbar'

" The nerd tree
Plugin 'The-NERD-tree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
"                     :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" end of vundle configuration

