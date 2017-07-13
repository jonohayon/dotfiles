set nocompatible
filetype plugin indent on

set fileencoding=utf-8
set encoding=utf-8

set modelines=1

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim' " For da themese
Plug 'vim-airline/vim-airline' " For da shit
Plug 'vim-airline/vim-airline-themes' " For da shit's themes
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " For da beloved sidebar
Plug 'scrooloose/syntastic' " For da linters
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' } " For da navigation
Plug 'Tpope/vim-commentary' " For da commentz
Plug 'Valloric/MatchTagAlways' " Always match dem HTML tags
Plug 'mxw/vim-jsx' " Syntax highlighting for JSX aka React
Plug 'pangloss/vim-javascript' " Syntax highlighting for JS aka lyfe
Plug 'toyamarinyon/vim-swift' " Syntax highlighting for Swift aka love
Plug 'latex-box-team/latex-box' " The real deal for LaTeX in Vim
Plug 'Valloric/YouCompleteMe' " Autocomplete ayyy
Plug 'mattn/emmet-vim' " Emmet 4 vim
Plug 'airblade/vim-gitgutter' " GitGutter ayy
Plug 'raimondi/delimitmate' " Match dem qutes, parens etc.
Plug 'jeetsukumaran/vim-buffergator' " A nice window for switching buffers
Plug 'jistr/vim-nerdtree-tabs' " NERDTree + tabs
Plug 'mhinz/vim-startify' " Upping my start window game abit
Plug 'ryanoasis/vim-devicons' " NERDTree file iconz
Plug 'SirVer/ultisnips' " Code snipptes #1
Plug 'honza/vim-snippets' " Code snippets #2
Plug 'mattn/emmet-vim' " Emmet
Plug 'leafgarland/typescript-vim' " TypeScript syntax highlighting
call plug#end()

" Editor shit
set number
set linebreak
set scrolloff=6
set backspace=indent,eol,start
set autoread
set showcmd
set lazyredraw
set wildmenu
set wildmode=full
set laststatus=2
set timeout
set timeoutlen=1000
set ttimeoutlen=50

" Syntax highlighting and linters
let g:syntastic_javascript_checkers = ['standard', 'eslint']

" Search
set incsearch
set showmatch
set smartcase
set ignorecase
set hlsearch
set gdefault

" Mappings - making vim work pretty much like Sublime cuz I'm a n00b lmao
" Open sidebar - NERDTree
map <C-b> :NERDTreeToggle %:p:h<CR>
" Not used a ton - source the current file and install plugins (cuz vimrc is bae)
map <F8> :source %<CR>:PlugInstall<CR>
" Save the document
imap <C-s> <Esc>:w<CR>i
" Go to end of line
imap <C-e> <Esc>$i<Right>
" Go to beginning of line
imap <C-a> <Esc>^i
" Toggle comment on current line
imap <D-_> <Esc>gcc<CR><Up>i

" Colorz and theme action
set termguicolors
let base16colorspace = 256
set background=dark
colorscheme base16-bright
syntax on

" Airline Config
let g:airline_theme = 'base16_bright'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Tabs aka spaces
set autoindent
set smartindent
set expandtab " ONLY SPACES HOMIE
set shiftround

" 2 SPACES AYYY
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Open .eslintrc as JSON
au BufReadPost .eslintrc set syntax=json

" Open .tern-project and .tern-config as JSON
au BufReadPost .tern-project set syntax=json
au BufReadPost .tern-config set syntax=json

