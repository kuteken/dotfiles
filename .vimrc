"========================================
"vim options
"========================================
"set input
set autoindent
set list
set showcmd
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"set display
set number
set ruler
set wrap
set display=lastline
set pumheight=10 "completion menu height
set showmatch
set matchtime=1

"set keybind
inoremap <C-v> var_dump();<Left><Left>
inoremap <silent> jj <ESC>
nnoremap Y y$

"set encoding
set encoding=utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileformats=unix,dos,mac

"========================================
"Syntax
"========================================
syntax on
au BufRead,BufNewFile *.twig set syntax=htmljinja

"========================================
"NeoBundle
"========================================
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
" Navigation
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
" Completion
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundleLazy 'vim-scripts/javacomplete', {
  \   'build': {
  \       'cygwin': 'javac autoload/Reflection.java',
  \       'mac': 'javac autoload/Reflection.java',
  \       'unix': 'javac autoload/Reflection.java',
  \   },
  \}
" Coding
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
" Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" Search
NeoBundle 'grep.vim'
nnoremap <expr> gr ':Rgrep<CR>'

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

call neobundle#end()

"========================================
"NERD Tree
"========================================
nmap <silent> <F1> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40
