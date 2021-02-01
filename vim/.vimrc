set nocompatible
set tabstop=4
set shiftwidth=4
set smarttab
set et
set wrap
set ai

set showmatch
set hlsearch
set incsearch
set ignorecase
set lz

set listchars=tab:··
set list

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

set guioptions-=T
set guioptions-=m

set number 
syntax on
"filetype plugin on
filetype off

color desert

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

"filetype plugin indent on     " обязательно!

"репозитории на github
Bundle 'tpope/vim-fugitive'
Bundle 'lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-surround'
Bundle 'Glench/Vim-Jinja2-Syntax'
"Bundle 'chase/vim-ansible-yaml'
Bundle 'pearofducks/ansible-vim'
Bundle 'scrooloose/nerdtree'
"репозитории vim/scripts
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'
"Bundle 'Vim-Jinja2-Syntax'

"git репозитории (не на github)
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/martinda/Jenkinsfile-vim-syntax.git'
Bundle 'shime/vim-livedown'
filetype indent on
if has('gui')
    colorscheme darkblue
    if has('win32')
        set guifont=Lucida_Console:h12:cRUSSIAN::
    else
        set guifont=Terminus\ 14
    endif
endif
vmap cc :norm i#<CR>
vmap uc :norm ^x<CR>
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
nnoremap ld :LivedownToggle<CR>
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
